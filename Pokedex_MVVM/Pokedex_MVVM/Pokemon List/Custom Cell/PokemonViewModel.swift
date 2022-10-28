//
//  PokemonViewModel.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/20/22.
//

import Foundation
protocol PokemonViewModelDelegate: AnyObject {
    func configure(with pokemon: Pokemon)
}

class PokemonViewModel {
    private let pokemonService: PokemonServiceable
    var pokemon: Pokemon?
    var pokedex: PokemonResults
    
    weak var delegate: PokemonViewModelDelegate?
    
    init(pokemonService: PokemonServiceable = PokemonSearchService(), pokedex: PokemonResults, delegate: PokemonViewModelDelegate) {
        self.pokemonService = pokemonService
        self.pokedex = pokedex
        self.delegate = delegate
        fetchPokemon()
    }
    
    func fetchPokemon() {
        pokemonService.fetch(from: .pokemon(pokedex.name)) { result in
            switch result {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                    self.delegate?.configure(with: pokemon)
                }
            case .failure(let error):
                print("Error fetching pokemon!", error.errorDescription!)
            }
        }
    }
}
