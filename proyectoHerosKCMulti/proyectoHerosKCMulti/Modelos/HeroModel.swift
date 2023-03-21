//
//  HeroModel.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import Foundation


struct Heroes : Codable, Identifiable {
    var id : UUID
    var name : String
    var description : String
    var photo : String
    var favorite : Bool?
}

struct HerosFilter : Codable{
    var name : String
}
