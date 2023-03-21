//
//  LoginView.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 15/3/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject  var rootviewModel:  RootViewModel

    /*
        Le digo el tipo y el sistema va a buscarlo al entorno de objetos.
     
     */
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            //imagenfondo
            Image(decorative: "backgroundLogin")
                .resizable()
                .opacity(1)
            Image(decorative: "")
                .resizable()
                .background(Color.black)
                .opacity(0.2)
            VStack{
                Image(decorative: "title")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .opacity(0.8)
                    .padding(.top, 170)
                Spacer()
                VStack{
                    //usasrio, clave y boton
                    TextField("Email", text: $email)
                        .padding(10)
                        .background(.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        //.autocapitalization(.none)//hasta iOS15
                        .textInputAutocapitalization(.never)//iOS16)
                        //.disableAutocorrection(.true)//hasta iOS15
                        .autocorrectionDisabled()//iOS16
                        .opacity(0.92)
                        .id(1)// for UI testing
                    SecureField("Clave", text: $password)
                        .padding(10)
                        .background(.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        //.autocapitalization(.none)//hasta iOS15
                        .textInputAutocapitalization(.never)//iOS16)
                        //.disableAutocorrection(.true)//hasta iOS15
                        .autocorrectionDisabled()//iOS16
                        .opacity(0.92)
                        .padding(.top)
                        .id(2)// for UI testing
                    //boton
                    Button {
                        rootviewModel.login(user: email, password : password)
                    } label: {
                        Text("Entrar")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(.red)
                            .cornerRadius(15)
                            .shadow(radius: 10.0 , x: 20, y: 10)
                    }
                    .padding(.top, 50)
                    .opacity(0.9)
                    .id(3)

                    
                        
                }
                .padding([.leading, .trailing], 30)
                Spacer()
            }
        }
        .ignoresSafeArea()
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environment(\.locale, .init(identifier: "es"))
    }
}
