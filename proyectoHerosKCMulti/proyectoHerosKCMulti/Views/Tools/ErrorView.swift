//
//  ErrorView.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var viewModel : RootViewModel
    private var textError: String
    
    init(error : String) {
        self.textError = error
    }
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
                .padding()
            Text("\(textError)")
                .foregroundColor(.red)
                .font(.title)
            Spacer()
            
            //boton
            Button("Volver"){
                //TODO: volver al login
                self.viewModel.status = .none
            }
            .frame(width: 300, height: 50)
            .background(.orange)
            .font(.title2)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 10.0, x: 20)
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Error de prueba")
            .environmentObject(RootViewModel())
    }
}
