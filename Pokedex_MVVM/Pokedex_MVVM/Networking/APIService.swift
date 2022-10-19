//
//  APIService.swift
//  Pokedex_MVVM
//
//  Created by Esther on 10/19/22.
//

import Foundation

///Network Service for our Fetch Call
struct APIService {

     func perform(_ request: URLRequest, completion: @escaping (Result<Data, ResultError>) -> Void) {
        // Data Task
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("Completed with a response of", response.statusCode)
            }
            //Check for Data
            guard let data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
} // End of Struct
