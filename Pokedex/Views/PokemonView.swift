//
//  PokemonView.swift
//  Pokedex
//
//  Created by William Dupont on 30/08/2022.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    let dimensions: Double = 140
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.getPokemonId(pokemon: pokemon)).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                    
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
