//
//  Empleados.swift
//  multiplataformaKC
//
//  Created by Markel Juaristi on 15/3/23.
//

import Foundation
struct Empleado: Identifiable {
    let id : String
    let nombre : String
    let apellido1 : String
    let apellido2: String?
    let idPhoto: String
    let edad: Int
}


func  getTestData() -> [Empleado]{
    return [ Empleado(id: "100", nombre: "Markel", apellido1: "Juaristi", apellido2: "Mendarozketa", idPhoto: "01", edad: 30),
             Empleado(id: "101", nombre: "Maite", apellido1: "del Corte", apellido2: "Mendarozketa", idPhoto: "02", edad: 31),
             Empleado(id: "102", nombre: "Aitor", apellido1: "Juaristi", apellido2: "Mendarozketa", idPhoto: "03", edad: 30),
             Empleado(id: "103", nombre: "Oscar", apellido1: "Lagullon", apellido2: "Mendarozketa", idPhoto: "04", edad: 30),
             Empleado(id: "104", nombre: "Jorge", apellido1: "Juarros", apellido2: "Mendarozketa", idPhoto: "05", edad: 29)]
}
