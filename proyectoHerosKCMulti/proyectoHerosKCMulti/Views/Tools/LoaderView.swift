//
//  LoaderView.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import SwiftUI

struct LoaderView: View {
    
    @State private var animationAmount = 0.5
    @State private var animate = false
    
    var body: some View {
        VStack{
            Image(decorative: "bola")
                .resizable()
                .frame(width: 40, height: 40)
                .scaleEffect(animationAmount)
                .animation(.easeInOut(duration: 1).repeatForever().repeatForever(autoreverses: true), value: animationAmount)
                .onAppear{
                    animationAmount = 1
                }
            
            Text("Cargando...")
                .font(.title)
                .foregroundColor(.red)
                .padding(.top, 100)
        }
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
