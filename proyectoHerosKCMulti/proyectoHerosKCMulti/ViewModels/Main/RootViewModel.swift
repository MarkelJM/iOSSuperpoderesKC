//
//  RootViewModel.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import Foundation
import Combine

public let CONST_TOKEN_ID = "KeepcodingJWTAppHeros"

final class RootViewModel: ObservableObject {
    @Published var  status: Status = Status.none
    @Published var isLogged: Bool = false
    
    //Token JWT
    /*
    @Published var tokenJWT: String = "" {
        didSet{
            //asigno valor token
            print("\(tokenJWT)")
            saveKV(key: "", value: tokenJWT)
            
        }
    }
     */
    
    @kcPersistenceKeyChain(key: CONST_TOKEN_ID) var tokenJWT{
        didSet{
            print("\(tokenJWT)")
        }
    }
    
    
    var suscriptores = Set<AnyCancellable>()
    
    init() {
        self.logedUserControl()
    }
    /*
    //contro usuario conectado
    func  logedUserControl() {
        let tokenOptional = loadKC(key: CONST_TOKEN_ID)
        
        if let token = tokenOptional {
            tokenJWT = token
            
            if token.count > 0 {
                status = .loaded //token OK
            }
        }
    }
     */
    func  logedUserControl() {
        if tokenJWT != ""{
            status = .loaded
        }
    }
    
    func closeSession(){
        tokenJWT = ""
        status = .none //enviar al login
    }

    
    
    //login al servidor
    func login(user: String, password : String){
        self.status = Status.loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionLogin(user: user, password: password))
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    //error de login
                    throw URLError(.badServerResponse)
                }
                
                //login OK
                return String(decoding: $0.data, as: UTF8.self)
            }
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                
                switch completion{
                case .failure :
                    self.status = Status.error(error: "Usuario/clave incorrecto")
                case .finished :
                    self.status = Status.loaded
                }
            } receiveValue : { token in
                self.tokenJWT = token
                
            }
            .store(in: &suscriptores)
        
        
        
        
    }
}
