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
    
    weak var delegate: PokedexViewModelDelegate
    init(delegate: PokedexViewModelDelegate) {
        self.delegate = delegate
    }
}
