//
//  BaseNetwork.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import Foundation

let server = "https://dragonball.keepcoding.education"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
    static let content = "application/json"
    
}

enum endpoints : String {
    case login = "/api/auth/login"
    case heroList = "/api/" //debo completarlo mirando su repo
}

struct BaseNetwork {
    //funcion que devuelve el request
    func  getSessionLogin(user: String, password : String) -> URLRequest{
        let urlcad : String = "\(server)\(endpoints.login.rawValue)"
        
        let encodeCredential = "\(user):\(password)".data(using: .utf8)?.base64EncodedString()
        var segCredentials : String = ""
        
        if let credential = encodeCredential{
            segCredentials = "Basic \(credential)"
        }
        
        //creamos la request
        var request : URLRequest = URLRequest(url: URL(string: urlcad)!)
        request.httpMethod = HTTPMethods.post
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        request.addValue(segCredentials, forHTTPHeaderField: "Authorization")
        
        return request
        
    }
    
    //lista de heroes
    
    func getSessionHeros(filter: String) -> URLRequest{
        let urlcad : String = "\(server)\(endpoints.login.rawValue)"
        var request : URLRequest = URLRequest(url: URL(string: urlcad)!)
        request.httpMethod = HTTPMethods.post
        
        request.httpBody = try? JSONEncoder().encode(HerosFilter(name: filter))
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        
        //> Seguridad
        
        if let token = loadKC(key:  CONST_TOKEN_ID){
            request.addValue("", forHTTPHeaderField: "Authorization")
        }
        return request

    }
}
