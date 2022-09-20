//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by William Dupont on 30/08/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
             PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(viewModel.pokemonDetails?.id ?? 0)")
                Text("**Height**: \(viewModel.formatHeightAndWeight(value: viewModel.pokemonDetails?.height ?? 0)) M")
                Text("**Height**: \(viewModel.formatHeightAndWeight(value: viewModel.pokemonDetails?.weight ?? 0)) KG")
            }
        }
        .onAppear {
            viewModel.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
    }
}
