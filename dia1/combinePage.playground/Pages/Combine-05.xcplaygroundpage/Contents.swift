import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true


enum NetworkErrors: Error {
    case general(String)
    case timeout(String)
    case notFound(String)
    case badConnection(String)
    
}


var photo : UIImage?{
    didSet{
        print("foto recibidia")
    }
}


let url = URL(string: "https://imagenes.20minutos.es/files/image_990_v3/uploads/imagenes/2018/04/25/Black-Panther-Wakanda-Civil-War.jpg")!

let suscriptor = URLSession.shared
    .dataTaskPublisher(for: url)
    .mapError{ error -> NetworkErrors in
        if  error.errorCode == -1001 {
            return .timeout(error.localizedDescription)
        }else {
            return .general(error.localizedDescription)
        }
    }
    .retry(3)
    .tryMap() { element -> Data in
        guard let  httpResponse = element.response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return element.data
    }
    .map{
        UIImage(data:  $0)
    }
    .receive(on: RunLoop.main)
    .sink { completion in
        switch completion{
        case .failure(let error):
            print("Ejerci1 Error \(error)")
        case.finished:
            print("Ejercicio 1 Sucess Download")
        }
    } receiveValue: { foto in
        if let fotoDown = foto{
            photo = fotoDown
        }
    }




//EJEMPLO 2

class viewModelPhoto {
    var photo : UIImage?{
        didSet{
            print("foto recibidia")
        }
    }
    init(){
        
    }
    
    var suscribersSecond = Set<AnyCancellable>()
    
    func DownloadImage(urls: String) -> Void{
        let url = URL(string: urls)!
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map{
                UIImage(data:  $0.data)
            }
            .replaceError(with: UIImage(named: "person.crop.circle.badge.exclamationmark"))
            .receive(on: DispatchQueue.main)
            .sink {
                
                if let photoDown = $0{
                    self.photo = photoDown
                }
            }
            .store(in: &suscribersSecond)
    }
}

let viewModel = viewModelPhoto()
viewModel.DownloadImage(urls: "https://imagenes.20minutos.es/files/image_990_v3/uploads/imagenes/2018/04/25/Black-Panther-Wakanda-Civil-War.jpg")
viewModel.photo

