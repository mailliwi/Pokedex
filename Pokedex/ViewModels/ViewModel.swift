//
//  ViewModel.swift
//  Pokedex
//
//  Created by William Dupont on 30/08/2022.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func getPokemonId(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonId(pokemon: pokemon)
        self.pokemonDetails = PokemonDetail(id: 0, height: 0, weight: 0)
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    func formatHeightAndWeight(value: Int) -> String {
        let doubleValue = Double(value)
        let string = String(format: "%.2f", doubleValue / 10)
        
        return string
    }
}
