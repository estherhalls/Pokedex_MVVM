//
//  PokedexTableViewController.swift
//  Pokedex_MVVM
//
//  Created by Karl Pfister on 2/16/22.
//

import UIKit

class PokedexTableViewController: UITableViewController {
    
    var pokedexViewModel: PokedexViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokedexViewModel = PokedexViewModel(delegate: self)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokedexViewModel.pokedexResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonTableViewCell else {return UITableViewCell()}
        
        cell.viewModel = PokemonViewModel(pokedex: pokedexViewModel.pokedexResults[indexPath.row], delegate: cell)
        
        return cell
    }
    
    //MARK: - Pagination
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let pokedexViewModel = pokedexViewModel,
              let pokedex = pokedexViewModel.pokedex else {return}
        
        let lastPokedexIndex = pokedex.results.count - 1
        
        if indexPath.row == lastPokedexIndex {
            pokedexViewModel.nextURL()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toPokemonDetails",
              let destinationVC = segue.destination as? PokemonViewController,
              let cell = sender as? PokemonTableViewCell,
              let pokemonToSend = cell.viewModel.pokemon else {return}
        let sprite = cell.pokemonImageView.image
        destinationVC.viewModel = PokemonDetailViewModel(pokemon: pokemonToSend, spriteImage: sprite)
    }
} // End of Class

extension PokedexTableViewController: PokedexViewModelDelegate {
    func pokedexResultsLoaded() {
        tableView.reloadData()
    }
    func errorAlert(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Try Again?", style: .default, handler: { [weak self] _ in
            self?.pokedexViewModel?.loadPokedexResults()
        }))
        present(alertController, animated: true)
    }
}
