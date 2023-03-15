//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import Combine

PlaygroundPage.current.needsIndefiniteExecution = true

//Modelos

struct BootCamps: Codable {
    let id : UUID
    let name: String
}



//Extension URLResponse

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

final class testLoad{
    
    var bootcamp: [BootCamps] = Array<BootCamps>()
    var suscriptor = Set<AnyCancellable>()
    
    func loadBootCamps(){
        let url = URL(string: "https://dragonball.keepcoding.education/api/data/bootcamps")
        
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTaskPublisher(for: request)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.getStatusCode() == 200 else {
                    throw URLError(.badServerResponse)
                }
                //todo ok
                return $0.data
            }
            .decode(type: [BootCamps].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion  {
                case .failure(let error):
                    print("error \(error)")
                case .finished:
                    print("fin ok")
                }
                
            } receiveValue: { data in
                data.forEach{ boot in
                    print("\(boot.name)")}
            }
            .store(in: &suscriptor)
    }
    
}
