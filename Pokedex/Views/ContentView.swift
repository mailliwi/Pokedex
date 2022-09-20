//
//  ContentView.swift
//  Pokedex
//
//  Created by William Dupont on 30/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 12) {
                    ForEach(viewModel.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: viewModel.filteredPokemon.count)
            }
            .navigationTitle("Pokeduck")
            .searchable(text: $viewModel.searchText)
        }
        .environmentObject(viewModel)
    }
}
