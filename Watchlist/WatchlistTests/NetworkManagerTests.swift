//
//  NetworkManagerTests.swift
//  WatchlistTests
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import XCTest
@testable import Watchlist

class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager?
    
    override func setUp() {
        super.setUp()
        sut = NetworkManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_data() {
        
        let sut = self.sut!
        
        let expect = XCTestExpectation(description: "callback")
        
        sut.fetchTabs() { (result) in
            expect.fulfill()
            
            switch result {
            case .error(let error) :
                print("Error Fetching Data: \(error)")
                break
            case .results(let data):
                XCTAssertEqual(data.count, 4)
                for category in data {
                    XCTAssertNotNil(category.categoryID)
                }
            }
        }
        wait(for: [expect], timeout: 3.1)
    }
}
