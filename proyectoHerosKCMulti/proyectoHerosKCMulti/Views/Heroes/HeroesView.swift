//
//  HeroesView.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 21/3/23.
//

import SwiftUI

struct HeroesView: View {
    
    @StateObject var viewModel : viewModelheroes
    @State private var filter = ""
    
    var body: some View {
        NavigationStack{
            List{
                if let heros = viewModel.heros{
                    ForEach(heros) { hero in
                        Text("\(hero.name)")
                    }
                }
            }
        }
        
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: viewModelheroes(testing: true))
    }
}
