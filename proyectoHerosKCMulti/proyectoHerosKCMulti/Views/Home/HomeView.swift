//
//  HomeView.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    @EnvironmentObject var rootviewModel: RootViewModel
    
    var body: some View {
        ZStack{
            
            
            
            TabView(selection : $selection){
                HeroesView(viewModel: viewModelheroes())
                    .tabItem{
                        Image(systemName: "house")
                        Text("Heroes")
                    }.tag(0)
                Text("Keepcoders")
                    .tabItem{
                        Image(systemName: "person")
                        Text("keepcoders")
                    }.tag(1)
                //tab3
                VStack{
                        Text("Configuracion")
                    Button {
                        //Close session
                        rootviewModel.closeSession()
                    } label: {
                        Text("Cerrar session")
                    }

                    
                }
                .tabItem {
                        Image(systemName: "gear")
                        Text("Config")
                    }.tag(2)
            }
            /*
            Button{
                //TODO
            } label: {
                Text("Next")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                
                    
            }
             */
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RootViewModel())
    }
}
