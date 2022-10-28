//
//  PokemonTableViewCell.swift
//  Pokedex_MVVM
//
//  Created by Karl Pfister on 2/16/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    
    // Cell view model
    var viewModel: PokemonViewModel
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
    }
    

} // End of Class
