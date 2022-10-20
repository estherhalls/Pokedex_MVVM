//
//  PokedexServiceProvider.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/20/22.
//

import Foundation

/// protocol naming convention for dependency inversion: name ends with "-able"
protocol PokedexServiceable {
    func fetch(from endpoint: PokemonEndpoint, completion: @escaping (Result<Pokedex, NetworkError>) -> Void)
    }

struct PokedexService: PokedexServiceable {
    /// Give directed access to APIService without making it static and available to all files on APIService file
    /// This is a concrete type (of struct or class) because it is initializing a whole-ass instance of this APIService structure
    private let service = APIService()
    
    /// Network Call URL from desired case in PokemonEndpoint
    func fetch(from endpoint: PokemonEndpoint, completion: @escaping (Result<Pokedex, NetworkError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        
        service.perform(urlRequest) { result in
            switch result {
            case.failure(let error):
                completion(.failure(.requestError(error)))
            case.success(let data):
                do {
                    let pokedex = try JSONDecoder().decode(Pokedex.self, from: data)
                    completion(.success(pokedex))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            }
        }
    }
}
