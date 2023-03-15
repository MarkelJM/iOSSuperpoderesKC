//
//  EmpleadoRowView.swift
//  multiplataformaKC
//
//  Created by Markel Juaristi on 15/3/23.
//

import SwiftUI

struct EmpleadoRowView: View {
    
    var employee : Empleado
    
    var body: some View {
        VStack{
            #if os(watchOS)
            Image(systemName: "person")
                .resizable()
                .frame(width: 50, height: 50)
                
                
            
            HStack{
                Spacer()
                Text(employee.nombre)
                
                Spacer()
            }
            
            #else
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height: 100)
                
                
            
            HStack{
                Spacer()
                Text(employee.nombre)
                Text(employee.apellido1)
                
                if let apell2 = employee.apellido2{
                    Text(apell2)
                }
                
            #endif
            }
            
            
                
            }
        }
        .background(Color.gray)
        .cornerRadius(10)
    }
}

struct EmpleadoRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmpleadoRowView(employee: Empleado(id: "01", nombre: "Markel", apellido1: "Juaristi", apellido2: "Mendarozketa", idPhoto: "01", edad: 30))
    }
}
