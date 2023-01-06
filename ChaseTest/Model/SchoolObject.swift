//
//  SchoolObject.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/5/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation

struct SchoolObject: Codable, CustomStringConvertible {
    let school: School
    let satScore: SchoolSATScore
    
    var description: String {
        "School name: \(school.school_name), dbn: \(school.dbn) and STA Takers: \(satScore.num_of_sat_test_takers)"
    }
}
