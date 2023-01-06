//
//  ContentView.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var schoolsFetcher: SchoolsFetchViewModel
    @State var shouldRefresh = false
    
    var body: some View {
        VStack {
            
            //Show loading indicator to user when API calls are in progress
            if schoolsFetcher.viewState == .loading {
                LoadingView()
            }
            
            //Display Error View to user as the upstraem API failerd
            if schoolsFetcher.viewState == .error {
                ErrorView(errorMessage:schoolsFetcher.errorMessage!, shouldRefresh: $shouldRefresh.onUpdate {
                    if self.shouldRefresh == true {
                        self.schoolsFetcher.fetchALLNYCSchools()
                    }
                })
            }
            
            //Display Defauly message as the list is empty
            if schoolsFetcher.viewState == .empty {
               EmptyView(shouldRefresh: $shouldRefresh.onUpdate {
                   if self.shouldRefresh == true {
                       self.schoolsFetcher.fetchALLNYCSchools()
                   }
               })
            }
            //Display List OF NYC Schools
            if schoolsFetcher.viewState == .loaded {
                SchoolsListView(schools: schoolsFetcher.schools)
            }
        }
        .onAppear(perform: {
            self.schoolsFetcher.fetchALLNYCSchools()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(schoolsFetcher: SchoolsFetchViewModel())
    }
}
