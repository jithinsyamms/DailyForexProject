//
//  ForexAPIResource.swift
//  DailyForexProject
//
//  Created by Jithin on 27/12/21.
//

import Foundation

struct ForexResource:APIResource {
    
    typealias Model = Forex
    
    var scheme: String{
        "https"
    }
    var baseURL: String{
        Constants.BaseURL
    }
    var path: String{
        "/api/v1/dashboard"
    }
    var method: String{
        "GET"
    }
    
}
