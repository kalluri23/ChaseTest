//
//  SchoolsFetchServiceIntegrationTests.swift
//  ChaseTestTests
//
//  Created by Krishna teja Kalluri on 1/4/23.
//  Copyright © 2023 JP Morgan Chase. All rights reserved.
//

import XCTest
import Combine
@testable import ChaseTest

class SchoolsFetchServiceIntegrationTests: XCTestCase {
    
    var cancellables:[AnyCancellable] = []
    var sut: SchoolsFetchService? = nil
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = makeSUT()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellables.removeAll()
        sut = nil
    }
    
    func testSchoolsFetchService_when_getSchoolsList_should_returnSchoolObjects() {
        
        let fetchSchoolsListexpectation = XCTestExpectation(description: "Wait for Schools List API to return")
        
        var schools:[School] = []
        
        //GIVEN
        guard let testSut = sut else {
            XCTFail("SUT is not Initialized")
            return
        }
        
        //WHEN
        let subscription = testSut.fetchSchoolsList().sink(receiveCompletion: {(complete) in
            switch complete {
            case .finished:
                fetchSchoolsListexpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }, receiveValue: { schoolsList in
            schools = schoolsList
            print("Schhols List Count is: \(schools.count)")
            XCTAssert(schools.count > 0, "School List is Empty")
        })
        
        subscription.store(in: &cancellables)
        
        //THEN
        wait(for: [fetchSchoolsListexpectation], timeout: 2)
        
    }
    
    func testSchoolsFetchService_when_getSchoolsSATScores_should_returnSchoolsSATScore() {
        
        let fetchSchoolsSATScoreListexpectation = XCTestExpectation(description: "Wait for Schools List API to return")
        
        var schoolsSATScores:[SchoolSATScore] = []
        
        //GIVEN
        guard let testSut = sut else {
            XCTFail("SUT is not Initialized")
            return
        }
        
        //WHEN
        let subscription = testSut.fetchSchoolsSATScore().sink(receiveCompletion: {(complete) in
            switch complete {
            case .finished:
                print("API call returned")
                fetchSchoolsSATScoreListexpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }, receiveValue: { schoolsSATScoreList in
            schoolsSATScores = schoolsSATScoreList
            print("Schhols SAT Score List Count is: \(schoolsSATScores.count)")
            XCTAssert(schoolsSATScores.count > 0, "Schools SAT Score List is Empty")
        })
        
        subscription.store(in: &cancellables)
        
        //THEN
        wait(for: [fetchSchoolsSATScoreListexpectation], timeout: 2)
        
    }
    
    func testSchoolsFetchService_when_getSchoolObjects_should_returnSchoolObjects() {
        
        let fetchSchoolObjectsListexpectation = XCTestExpectation(description: "Wait for Schools List API to return")
        
        var schoolObjects:[SchoolObject] = []
        
        //GIVEN
        guard let testSut = sut else {
            XCTFail("SUT is not Initialized")
            return
        }
        
        //WHEN
        let subscription = testSut.fetchSchools().sink(receiveCompletion: {(complete) in
            switch complete {
            case .finished:
                print("API call returned")
                fetchSchoolObjectsListexpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }, receiveValue: { schoolObjectList in
            schoolObjects = schoolObjectList
            print("School Objects List Count is: \(schoolObjects.count)")
            XCTAssert(schoolObjects.count > 0, "School Objects List is Empty")
        })
        
        subscription.store(in: &cancellables)
        
        //THEN
        wait(for: [fetchSchoolObjectsListexpectation], timeout: 60)
        
    }
    
    func makeSUT() -> SchoolsFetchService {
        return SchoolsFetchService.shared
    }

}
