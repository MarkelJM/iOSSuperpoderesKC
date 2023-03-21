//
//  keychain.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 15/3/23.
//

import Foundation
import KeychainSwift

@discardableResult
func saveKV(key: String, value : String) -> Bool {
    if let data = value.data(using: .utf8){
        let keychain = KeychainSwift()
        keychain.set(data, forKey: key)
        return true
    } else {
        return false
    }
}

func loadKC(key: String)-> String?{
    let keychain = KeychainSwift()
    
    if let data = keychain.get(key){
        return data
    } else {
        return ""
    }
}

func deleteKC(key: String){
    let keychain = KeychainSwift()
    keychain.delete(key)

}
