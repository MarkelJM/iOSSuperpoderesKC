//
//  kcPersistentKeyChain.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import Foundation

@propertyWrapper
class kcPersistenceKeyChain{
    
    private var key: String
    
    init(key: String) {
        self.key = key
    }
    
    var wrappedValue : String {
        get {
            if let value = loadKC(key: key) {
                return value

            } else {
                return ""
            }
        }
        set {
                saveKV(key: key, value: newValue)//al asignar grabamos en el KC
        }
    }
    
}
