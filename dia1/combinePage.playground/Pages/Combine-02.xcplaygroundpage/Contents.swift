
import Combine


let publisher1 = [1,2,3,4].publisher


let suscritor1 = publisher1.sink { data in
    print("ejercicios1, recibo \(data)")
}


suscritor1.cancel()//cancela el suscriptor para no vuelva a recibir valores de publivcador




////ejercicio 2



let suscriptor2 : AnyCancellable?

let suscritor2 = publisher1.sink { data in
    print("ejercicios2, recibo \(data)")
}


// ejercicio 3


var suscriptor3 = Set<AnyCancellable>()

publisher1.sink { data in
    print("Ejerciio3 - recibo \(data)")
}
.store(in: &suscriptor3)






class viewModel{
    //modelo
    var valor: String = ""{
        didSet{
            print("ejercicio4- asignado valor:\(valor)")
        }
    }
    
    var suscriptor = Set<AnyCancellable>()
    
    func cargarDatos(){
        let publisher = ["Hola", "Mundo"].publisher
        
        publisher.sink { data in
            self.valor = data //asignado el modelo
            
        }
        .store(in: &suscriptor)
    }
}

let vm = viewModel()
