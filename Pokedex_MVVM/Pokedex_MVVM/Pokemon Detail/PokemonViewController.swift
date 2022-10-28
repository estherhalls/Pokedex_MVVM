//
//  PokemonViewController.swift
//  Pokedex_MVVM
//
//  Created by Karl Pfister on 2/16/22.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonSpriteImageView: UIImageView!
    @IBOutlet weak var pokemonMovesTableView: UITableView!
    
    // View Model
    var viewModel: PokemonDetailViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonMovesTableView.delegate = self
        pokemonMovesTableView.dataSource = self
        configureView()
    }
    
    func configureView() {
        if let spriteImage = viewModel.spriteImage {
            pokemonSpriteImageView.image = spriteImage
        }
        self.pokemonNameLabel.text = viewModel.pokemon.name.capitalized
        self.pokemonNameLabel.text = "ID: \(viewModel.pokemon.id)"
    }
    
} // End of Class

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Moves"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemon.moves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "moveCell", for: indexPath)
        let move = viewModel.pokemon.moves[indexPath.row].move.name
        cell.textLabel?.text = move
        return cell
    }
} // end
