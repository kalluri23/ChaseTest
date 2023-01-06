//
//  SchoolsListView.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import SwiftUI

struct SchoolsListView: View {
    let schools: [SchoolObject]
    var body: some View {
        VStack {
            Spacer().frame(height: 1)
            NavigationView {
                List {
                    ForEach(schools, id: \SchoolObject.school.dbn) { school in
                        NavigationLink(destination: SchoolDetailView(schoolObject: school)) {
                            SchoolRowView(schoolObject: school)
                        }
                    }
                }
                .navigationBarTitle(Text("NYC Schools"))
            }
            Spacer().frame(height: 4)
        }
    }
}

struct SchoolsListView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolsListView(schools: [])
    }
}
