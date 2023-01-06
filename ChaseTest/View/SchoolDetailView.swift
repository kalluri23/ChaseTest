//
//  SchoolDetailView.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import SwiftUI

struct SchoolDetailView: View {
    let schoolObject: SchoolObject
    
    var body: some View {
        VStack (alignment: .leading, spacing: 30) {
            //School Name
            VStack(alignment: .leading, spacing: 10) {
                Text("School Name:")
                    .font(.system(size: 30))
                Text(schoolObject.school.school_name)
                    .font(.system(size: 20))
            }
            
            //SAT Scores
            VStack(alignment: .leading, spacing: 10) {
                Text("SAT Sores:")
                    .font(.system(size: 30))
                VStack (alignment: .leading, spacing: 10) {
                    Text("Avg SAT Math Score: \(schoolObject.satScore.sat_math_avg_score)")
                    Text("Avg SAT Writing Score: \(schoolObject.satScore.sat_writing_avg_score)")
                    Text("Avg SAT Critical Reading Score: \(schoolObject.satScore.sat_critical_reading_avg_score)")
                }
                .font(.system(size: 20))
            }
            
            //School Desc
            VStack(alignment: .leading, spacing: 10) {
                Text("School Description:")
                    .font(.system(size: 30))
                Text(schoolObject.school.overview_paragraph)
                    .lineLimit(nil)
                    .font(.system(size: 15))
            }
            
            //School Boro
            VStack(alignment: .leading, spacing: 10) {
                Text("School Boro:")
                    .font(.system(size: 30))
                Text(schoolObject.school.boro)
                    .font(.system(size: 15))
            }
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

//struct SchoolDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolDetailView(school: <#SchoolObject#>)
//    }
//}
