//
//  APIServiceProtocol.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    func makeAPICall<T:Decodable>(withURL apiURL:URL?) -> AnyPublisher<T, APIError>
    static var sharedDecoder:JSONDecoder { get }
    static var shared : APIServiceProtocol { get }
}
