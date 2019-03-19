//
//  WatchlistTests.swift
//  WatchlistTests
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import XCTest
@testable import Watchlist

class WatchlistTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testCreationalCellViewModel() {
        
        let information = Information.init(infoID: 101, name: "First Info", modified: "2018-01-22T23:00:00.0000000Z")
        let cellViewModel = CellViewModel.init(tab: information)
        
        XCTAssertNotNil(cellViewModel)
    }
    
    func testCreationalCellViewModelValues() {
        
        let information = Information.init(infoID: 101, name: "First Info", modified: "2018-01-22T23:00:00.0000000Z")
        let cellViewModel = CellViewModel.init(tab: information)
        
        XCTAssertEqual(cellViewModel.infoID, 101)
        XCTAssertEqual(cellViewModel.name, "First Info")
        XCTAssertEqual(cellViewModel.date!, "Mon, Jan 22, 2018 - 23:00")
    }
    
    func testCreationalSectionViewModel() {
        
        let information = Information.init(infoID: 101, name: "First Info", modified: "2018-01-22T23:00:00.0000000Z")
        let cellViewModel = CellViewModel.init(tab: information)
        let sectionViewModel = SectionViewModel.init(title: "First Section", listTabs: [cellViewModel])
        
        XCTAssertNotNil(sectionViewModel)
    }
}
