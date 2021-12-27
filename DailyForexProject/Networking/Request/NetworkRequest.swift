//
//  NetworkRequest.swift
//  DailyForexProject
//
//  Created by Jithin on 27/12/21.
//

import Foundation

protocol NetworkRequest{
    associatedtype Model
    func decode(_ data:Data) -> Model?
    func execute(withCompletion completion: @escaping (Result<Model?,Error>) -> Void)
}

extension NetworkRequest {
    
    func load(_ url: URL?, withCompletion completion: @escaping (Result<Model?,Error>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            
            guard error == nil else{
                completion(.failure(error!))
                return
            }
            guard let data = data else{
                completion(.failure(NetworkError.serverError))
                return
            }
            guard let result = self.decode(data) else{
                completion(.failure(NetworkError.parsingError))
                return
            }
            DispatchQueue.main.async {
                completion(.success(result))
            }
        }
        task.resume()
    }
    
    
    
}
