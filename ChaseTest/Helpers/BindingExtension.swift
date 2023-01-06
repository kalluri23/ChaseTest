//
//  BindingExtension.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/5/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation
import SwiftUI

//We need this extension as the onchange listener support is not there for iOS 13
extension Binding {
    func onUpdate(_ closure: @escaping () -> Void) -> Binding<Value> {
        Binding(get: {
            self.wrappedValue
        }, set: { newValue in
            self.wrappedValue = newValue
            closure()
        })
    }
}
