//
//  ViewState.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation

//Enum to persist the state of a view from view models
enum ViewState {
    case loading
    case error
    case empty
    case loaded
}
