//
//  SchoolRowView.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import SwiftUI

struct SchoolRowView: View {
    let schoolObject: SchoolObject
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(schoolObject.school.school_name)
            Spacer()
        }
    }
}

//struct SchoolRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolRowView(schoolObject: <#SchoolObject#>)
//    }
//}
