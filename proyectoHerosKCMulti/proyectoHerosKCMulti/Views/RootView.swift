//
//  RootView.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var rootViewModel : RootViewModel
    
    var body: some View {
        switch rootViewModel.status{
        case .none:
            LoginView()
        case . register:
            Text("registo")
        case .loaded:
            HomeView()
        case .error(error: let errorString):
            ErrorView(error: errorString)
        case .loading:
            LoaderView()//loader
    }
        
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
