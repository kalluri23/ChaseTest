//
//  School.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation

struct School: Codable, CustomStringConvertible {
    var description: String {
        "School name: \(school_name), dbn: \(dbn) and boro: \(boro)"
    }
    let dbn: String
    let school_name: String
    let boro: String
    let overview_paragraph: String
}
