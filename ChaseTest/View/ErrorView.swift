//
//  ErrorView.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    @Binding var shouldRefresh: Bool
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text("\u{274C}")
            Text(errorMessage)
                .font(.system(size: 30))
                .foregroundColor(Color.red)
                .scaledToFill()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Button(action: {
                self.shouldRefresh = true
            }, label: {
                Text("Retry")
            })
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

//struct ErrorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorView(errorMessage: APIError.badURL.localizedDescription, shouldRefresh: <#Binding<Bool>#>)
//    }
//}
