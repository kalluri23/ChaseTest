//
//  APIService.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation
import Combine

class APIService: APIServiceProtocol {
    
    private static let networkService = APIService()
    
    private static let httpTimeOut:Double = 60.0
    
    static var shared:APIServiceProtocol {
        return networkService
    }
    
    static let urlSession = URLSession.shared
    
    static var sharedDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return decoder
    }
    
    func makeAPICall<T:Decodable>(withURL apiURL:URL?) -> AnyPublisher<T, APIError> {
        guard let url = apiURL else {
            return Fail(error: APIError.badURL).eraseToAnyPublisher()
        }
        return APIService.urlSession.dataTaskPublisher(for: url)
            .timeout(.seconds(APIService.httpTimeOut), scheduler: RunLoop.main) //HTTP Timeout 60s
            .tryMap({ (data, response) -> Data in
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200...299:
                        guard let object = try? JSONSerialization.jsonObject(with: data, options: []),
                            let apiData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
                            let prettyPrintedString = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue), prettyPrintedString.length > 0 else {
                                let decodingError = DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Empty data"))
                                throw APIError.decoding(decodingError)
                        }
                        return apiData
                    default:
                        throw APIError.badResponse(statusCode: httpResponse.statusCode)
                    }
                }else {
                    let urlResponseError = URLError(URLError.cannotFindHost, userInfo: [NSLocalizedDescriptionKey: "HTTP URL Response is nil"])
                    throw APIError.url(urlResponseError)
                }
            })
            .decode(type: T.self, decoder: APIService.sharedDecoder)
            .mapError({ recievedError -> APIError in
                if let urlError = recievedError as? URLError {
                    switch urlError {
                    case URLError.timedOut:
                        return APIError.timeout
                    default:
                        return APIError.url(urlError)
                    }
                }else if let decodingError = recievedError as? DecodingError {
                    return APIError.decoding(decodingError)
                }else {
                    return APIError.unknown
                }
            })
            .eraseToAnyPublisher()
    }
    
}
