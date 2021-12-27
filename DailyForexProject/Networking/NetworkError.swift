//
//  NetworkError.swift
//  DailyForexProject
//
//  Created by Jithin on 27/12/21.
//

import Foundation

enum NetworkError : Error{
    case serverError
    case parsingError
    case unknownError
    case invalidURL
}
