//: [Previous](@previous)

import Foundation


var name = ""{
    willSet{
        print("Nuevo valor futuro : \(newValue)")
    }
    
    didSet{
        print("ya asignadfo : \(name)")
    }
}

name = "Markel"

//KVO es ObjC

@objc class Person : NSObject {
    @objc dynamic var name = "Maite"
}

let persona = Person()

// creo un observador de name del objeto


persona.observe(\Person.name, options: .new ){ person, change in
    print("KVO cambia el nombre \(person.name)")
    
}

persona.name = "Aitor"
