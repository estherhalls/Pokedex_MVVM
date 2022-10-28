//
//  PokemonDetailViewModel.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/20/22.
//

import UIKit

class PokemonDetailViewModel {
    var pokemon: Pokemon
    var spriteImage: UIImage?
    
    init(pokemon: Pokemon, spriteImage: UIImage?) {
        self.pokemon = pokemon
        self.spriteImage = spriteImage
    }
}
