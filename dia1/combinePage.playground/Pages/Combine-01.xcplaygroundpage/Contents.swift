import Combine





// Ejemplo 1.array

let publisher1 = [1,2,3,4,5].publisher

publisher1.sink { data in
    print("Ejerc1- valor: \(data)")
}


//Ejercicio 2

publisher1.sink { completion  in
     //aqui evaluamos si ha ido bien o mal
    switch completion{
    case .failure(let error):
        print("Ejerci2 error \(error)")
    case .finished:
        print("Ejer2 . Finalizado Success")
    }
} receiveValue: { data in
    print("Ejercicio 2- valor : \(data)")
}

