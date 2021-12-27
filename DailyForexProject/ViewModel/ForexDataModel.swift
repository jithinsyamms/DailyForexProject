//
//  ForexDataModel.swift
//  DailyForexProject
//
//  Created by Jithin on 28/12/21.
//

import Foundation

class ForexDataModel:ObservableObject{
    
    @Published var forex:Forex?
    @Published var isLoading:Bool = false

    init() {
        fetchForexData()
    }
    
    func fetchForexData(){
        guard !isLoading else {
            return
        }
        isLoading = true
        let resource = ForexResource()
        let request = ForexRequest(resource: resource)
        request.execute { result in
            self.isLoading = false
            switch result{
            case .success(let forex):
                if let forex = forex{
                    self.forex = forex
                }
            case .failure( _):
                print("Failure")
            }
            
        }
    }
}
