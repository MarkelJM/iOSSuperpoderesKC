import Combine

//Operadores de Transformacion

let publisher1 = [1,2,3].publisher

let suscriber1 = publisher1
    .map{data in
        "\(data)€"
    }
    .sink { data in
        print("Recibo \(data)")
    }


let num = [1,1,2,2,3,4,5,6,7,8,9].publisher

num
    .filter{$0.isMultiple(of: 3)}
    .sink{
        print("multiplo de 3 : \($0)")
    }

num
    .removeDuplicates()
    .sink{
        print("borrar duplicados : \($0)")
    }

num
    .first(where: { $0 % 3 == 0})
    .sink {
        print("Primer resti a cero: \($0)")
    }



let publisher = [1,1,2,2,3,4,5,6,7,8,9].publisher

publisher

    .min()
    .sink{num in
        print("minimo . \(num)")
    }

let publisher2 = ["Thor", "Ragnareok", "IronMan", "capitanMarvel"].publisher

publisher2
    .min{$0.count < $1.count}
    .sink { num in
        print("minuimo \(num)")
    }
