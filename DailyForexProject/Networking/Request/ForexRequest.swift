//
//  ForexRequest.swift
//  DailyForexProject
//
//  Created by Jithin on 27/12/21.
//

import Foundation

class ForexRequest<Resource:APIResource>{
    let resource:Resource
    
    init(resource:Resource) {
        self.resource = resource
    }
}
extension ForexRequest:NetworkRequest {
    
    typealias Model = Forex
    
    func decode(_ data: Data) -> Forex? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return try? decoder.decode(Forex.self, from: data)
    }
    
    func execute(withCompletion completion: @escaping (Result<Model?, Error>) -> Void) {
        load(resource.URL, withCompletion:completion)
    }
    
}
