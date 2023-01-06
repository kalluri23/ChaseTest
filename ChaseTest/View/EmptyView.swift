//
//  EmptyView.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/5/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import SwiftUI

struct EmptyView: View {
    @Binding var shouldRefresh: Bool
    var body: some View {
        VStack (spacing: 30) {
            Spacer()
            Text("List is empty")
                .font(.system(size: 15))
                .foregroundColor(Color.red)
                .scaledToFill()
                .minimumScaleFactor(0.05)
                .lineLimit(1)
            Button(action: {
                self.shouldRefresh = true
            }, label: {
                Text("Retry")
                .font(.system(size: 15))
            })
            Spacer()
        }
    }
}

//struct EmptyView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmptyView()
//    }
//}
