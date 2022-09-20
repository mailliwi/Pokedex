//
//  PokemonModel.swift
//  Pokedex
//
//  Created by William Dupont on 30/08/2022.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    private enum CodingKeys: String, CodingKey { case name, url }
    
    static var samplePokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct PokemonDetail: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
