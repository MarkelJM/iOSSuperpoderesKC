//
//  ContentView.swift
//  multiplataformaKC
//
//  Created by Markel Juaristi on 15/3/23.
//

import SwiftUI

struct ContentView: View {
    
    private var Employees = getTestData() //lista de empleados
    
    var body: some View {
        List{
            ForEach(Employees) { employee in
                EmpleadoRowView(employee: employee)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
