//
//  LoadingView.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("\u{1F3EB}")
                .font(.system(size: 40))
            ActivityIndicator(isAnimating: true, style: .large)
            Text("Getting Schools List....")
                .font(.system(size: 20))
                .foregroundColor(Color.green)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
