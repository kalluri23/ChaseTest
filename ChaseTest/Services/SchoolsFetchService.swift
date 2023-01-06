//
//  SchoolsFetchService.swift
//  ChaseTest
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import Foundation
import Combine

struct SchoolsFetchService {
    static let schoolsListURL = URL(string: "https://data.cityofnewyork.us/resource/7crd-d9xh.json")
    
    static let schoolsSATScoreURL = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")
    
    static let shared = SchoolsFetchService()
    
    func fetchSchoolsList() -> AnyPublisher<[School], APIError> {
        return APIService.shared.makeAPICall(withURL: SchoolsFetchService.schoolsListURL)
    }
    
    func fetchSchoolsSATScore() -> AnyPublisher<[SchoolSATScore], APIError> {
        return APIService.shared.makeAPICall(withURL: SchoolsFetchService.schoolsSATScoreURL)
    }
    
    func fetchSchools() -> AnyPublisher<[SchoolObject], APIError> {
        
        let fetchSchoolsListPublisher:AnyPublisher<[School], APIError> = fetchSchoolsList()
        
        let fetchSchoolsSATScorePublisher:AnyPublisher<[SchoolSATScore], APIError> = fetchSchoolsSATScore()
        
        //Call the two APIs & reduce the schools list according to schools that are part of shools SAT score API
        return fetchSchoolsListPublisher.zip(fetchSchoolsSATScorePublisher)
            .tryMap({ ( schoolsList, schoolsSATScore) -> [SchoolObject] in
                var schoolObjects:[SchoolObject] = []
                schoolObjects = schoolsList.reduce(into: schoolObjects, { updatedSchoolListObjects, school in
                    if let satScore = schoolsSATScore.filter({ satScore in
                        satScore.dbn == school.dbn
                    }).first {
                        updatedSchoolListObjects.append(SchoolObject(school: school, satScore: satScore))
                    }
                })
                return schoolObjects.sorted(by: {school1, school2 in
                    school1.school.school_name < school2.school.school_name
                })
            })
            //Catch decoding errors & array reducing errors & propogate them as bad response to UI
            .catch({ error in
                Fail(error: APIError.badResponse(statusCode: (error as NSError).code))
            })
            .eraseToAnyPublisher()
        
    }
}
