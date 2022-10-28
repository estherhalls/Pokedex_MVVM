//
//  PokemonTableViewCell.swift
//  Pokedex_MVVM
//
//  Created by Karl Pfister on 2/16/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var pokemonImageView: ImageViewService!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    
    // Cell view model
    var viewModel: PokemonViewModel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
        pokemonNameLabel.text = nil
        pokemonIDLabel.text = nil
    }
    
    private func fetchImage(with spritePath: String) {
        guard let imageURL = URL(string: spritePath) else {return}
        pokemonImageView.fetchImage(using: imageURL)
    }
    
} // End of Class

extension PokemonTableViewCell: PokemonViewModelDelegate {
    func configure(with pokemon: Pokemon) {
        pokemonNameLabel.text = pokemon.name.capitalized
        pokemonIDLabel.text = "ID: \(pokemon.id)"
        fetchImage(with: pokemon.sprites.frontShiny)
    }
}
