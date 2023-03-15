import SwiftUI
import Combine
import PlaygroundSupport

//Modelos

struct Person : Codable {
    let id : UUID
    let name: String
    let apells: String
    let nif: String
    
}


enum Estados{
    case none, loading, loaded, error
}



// ViewModel

final class ViewModelPerson: ObservableObject {
    @Published var data: Person? //modelo de un empleado
    @Published var estado = Estados.none // el estado de la ejecucion
    
    init(){
        loadPerson()
    }
    
    func loadPerson(){
        estado = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.data = Person(id: UUID(), name: "Markel", apells: "Juaristi", nif: "12345678Q")
            self.estado = .loaded
        }
    }
    
}

//View

struct ContentView: View{
    @StateObject private var viewModel = ViewModelPerson() //es un objeto de estado
    var body : some View{
        switch viewModel.estado{
        case Estados.none:
            Text("Estado none")
        case Estados.loaded:
            VStack{
                if let data = viewModel.data{
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("\(data.name)")
                        .bold()
                } else {
                    Text("No data")
                }
            }
            .onReceive(self.viewModel.$estado){ estado in
                print("cambia el dato estado")
            }
            .onReceive(self.viewModel.$data){ datos in
                print("cambia el dato estado")
            }
                        

                
                
            
        case Estados.error:
            Text("se ha producido un error")
        case Estados.loading:
            Text("Se está cargando")
        

        }
            
    }
}

//fucione SwiftUI en un playground

PlaygroundPage.current.setLiveView(ContentView().frame(width: 200, height: 200))
