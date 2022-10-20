//
//  PokedexViewModel.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/20/22.
//

import Foundation
protocol PokedexViewModelDelegate: AnyObject {
    
}
class PokedexViewModel {
    var pokedex: Pokedex?
    var pokedexResults: [PokemonResults]
    private let pokedexService: PokedexServiceable
    weak var delegate: PokedexViewModelDelegate?
    
    /// give above types a value if they were not assigned there
    init(delegate: PokedexViewModelDelegate, pokedexService: PokedexServiceable = PokedexService()) {
        self.delegate = delegate
        self.pokedexService = pokedexService
        loadPokedexResults()
    }
    
    func loadPokedexResults() {
        pokedexService.fetch(from: .pokedex) { [weak self] result in
            self?.handle(pokedex: result)
        }
    }
    private func handle(pokedex result: Result<Pokedex, NetworkError>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let pokedex):
                self.pokedex = pokedex
                self.pokedexResults.append(contentsOf: pokedex.results)
                self.delegate?.pokedexResultsLoaded()
            case . failure(let error):
                print ("Error fetching data",
                error.localizedDescription)
                self.delegate?.encounteredAlert(error)
            }
        }
    }
    
}
