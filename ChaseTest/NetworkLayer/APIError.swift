//
//  APIError.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode:Int)
    case url(URLError)
    case timeout
    case decoding(DecodingError)
    case unknown
    
    var description: String {
        //Dev Debugging
        switch self {
        case .badURL:
            return "Invalid URL"
        case .badResponse(let statusCode):
            return "API Error with status code : \(statusCode)"
        case .url(let urlError):
            return urlError.localizedDescription
        case .decoding(let decodingError):
            return decodingError.localizedDescription
        case .unknown:
            return "Unknown error occured"
        case .timeout:
            return "API timed out"
        }
    }
    
    var localizedDescription: String {
        //User Feedback
        switch self {
        case .badURL, .decoding, .unknown, .timeout:
            return "Sorry, something went wrong"
        case .badResponse:
            return "Sorry, the connection to our server failed"
        case .url(let urlError):
            return urlError.localizedDescription
        }
    }
}
