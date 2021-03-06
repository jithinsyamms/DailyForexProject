//
//  APIResource.swift
//  DailyForexProject
//
//  Created by Jithin on 27/12/21.
//

import Foundation

protocol APIResource {
    associatedtype Model:Codable
    var scheme:String {get}
    var baseURL:String {get}
    var path:String {get}
    var method:String {get}
    var parameters:[URLQueryItem] {get}
    var headers:[URLQueryItem] {get}
}

extension APIResource{
    
    var URL:URL?{
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = parameters
        return components.url
    }
    
    var parameters:[URLQueryItem]{
        return []
    }
    var headers:[URLQueryItem]{
        return []
    }
}

