//
//  PokemonEndpoint.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/20/22.
//

import Foundation

/// Abstract the creation of our URLs to allow us to use any enpoint we want using one inclusive/interchangable function rather than a full function for each endpoint
/// Use enum because it allows cases
enum PokemonEndpoint {
    /// needs baseURL
    case pokedex
    /// needs  a URL component to be added to baseURL
    case pokemon(String)
    /// needs a nextURL from within the pokemon object
    case imageURL(URL)
    
    var endpoint: String {
        switch self {
        case .pokedex:
            return "name"
        case .pokemon:
            return "status"
        case .imageURL:
            return "nextURL"
        }
    }
    
    // Computed property (open scope)
    var url: URL? {
        guard var baseURL = URL.baseURL else {return nil}
        baseURL.appendPathComponent("pokemon")
        
        switch self {
        case .pokedex:
            return baseURL
        case .pokemon(let pokemon):
            baseURL.appendPathComponent(pokemon)
            return baseURL
        case .imageURL(let nextURL):
            return nextURL
        }
    }
}

// allow enum to access stored data
extension URL{
    static let baseURL = URL(string:"https://pokeapi.co/api/v2/")
}
