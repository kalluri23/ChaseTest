//
//  SchoolsFetchViewModel.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation
import Combine

class SchoolsFetchViewModel: ObservableObject {
    @Published var schools:[SchoolObject] = []
    @Published var viewState:ViewState = .loading
    var errorMessage: String? = nil
    
    var cancellables:Set<AnyCancellable> = []
    private let schoolsFetchPublisher: AnyPublisher<[SchoolObject], APIError>
    
    init() {
        schoolsFetchPublisher = SchoolsFetchService.shared.fetchSchools()
    }
    
    func fetchALLNYCSchools() {
        viewState = .loading
        errorMessage = nil
        schoolsFetchPublisher
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [unowned self] completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.viewState = .error
                case .finished:
                    if self.schools.isEmpty {
                        self.viewState = .empty
                    }else {
                        self.viewState = .loaded
                    }
                    
                }
            }, receiveValue: { [unowned self] schoolsList in
                if schoolsList.isEmpty {
                    self.viewState = .empty
                }else {
                    self.schools = schoolsList
                }
            })
        .store(in: &cancellables)
    }
    
    
}
