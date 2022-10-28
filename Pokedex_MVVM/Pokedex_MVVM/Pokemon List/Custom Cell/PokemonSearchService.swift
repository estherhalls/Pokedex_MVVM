//
//  PokemonSearchService.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/27/22.
//

import Foundation
protocol PokemonServiceable {
    func fetch(from endpoint: PokemonEndpoint, completion: @escaping (Result<Pokemon, NetworkError>) -> Void)
}

struct PokemonSearchService: PokemonServiceable {
    private let service = APIService()
    func fetch(from endpoint: PokemonEndpoint, completion: @escaping (Result<Pokemon, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        
        service.perform(request) { result in
            switch result {
            case .failure(let error):
                completion(.failure(.requestError(error)))
            case .success(let data):
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(.success(pokemon))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            }
        }
    }
}
