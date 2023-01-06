//
//  SchoolSATScore.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation

struct SchoolSATScore: Codable, CustomStringConvertible {
    var description: String {
        "School name: \(school_name), dbn: \(dbn) and SAT test takers: \(num_of_sat_test_takers)"
    }
    let dbn: String
    let school_name: String
    let num_of_sat_test_takers: String
    let sat_critical_reading_avg_score: String
    let sat_math_avg_score: String
    let sat_writing_avg_score: String
}
