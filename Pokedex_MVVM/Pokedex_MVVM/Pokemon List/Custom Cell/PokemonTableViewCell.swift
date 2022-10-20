//
//  PokemonTableViewCell.swift
//  Pokedex_MVVM
//
//  Created by Karl Pfister on 2/16/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
    }
    
    func updateViews(pokemonURlString: String) {
//        // get the pokemon, nest the image
//        NetworkingController.fetchPokemon(with: pokemonURlString) { result in
//            switch result {
//            case .success(let pokemon):
//                self.fetchImage(with:pokemon)
//                DispatchQueue.main.async {
//                    self.pokemonNameLabel.text = pokemon.name.capitalized
//                    self.pokemonIDLabel.text = "No: \(pokemon.id)"
//                }
//            case .failure(let error):
//                print("There was an error!", error.errorDescription!)
//            }
//        }
    }
    
    func fetchImage(with pokemon: Pokemon) {
        
//        NetworkingController.fetchImage(for: pokemon.sprites.frontDefault) { result in
//            switch result {
//            case .success(let image):
//                DispatchQueue.main.async {
//                    self.pokemonImageView.image = image
//                    self.pokemonNameLabel.text = pokemon.name.capitalized
//                    self.pokemonIDLabel.text = "No: \(pokemon.id)"
//                }
//            case .failure(let error):
//                print("There was an error!", error.errorDescription!)
//            }
//        }
       
    }
}
