//
//  Pokedex.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/27/22.
//

import Foundation

struct Pokedex: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonResults]
}

struct PokemonResults: Decodable {
    let name: String
    let url: String
}
