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

    var sut : TableViewModel!
    var mockNetwork: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetwork = MockNetworkManager()
        sut = TableViewModel(manager: mockNetwork)
    }
    
    override func tearDown() {
        super.tearDown()
        mockNetwork = nil
    }
    
    func testFetchData() {
        // Given
        mockNetwork.completeTabCategory = [TabCategory]()
        
        // When
        sut.fetchListCategories()
        
        // Assert
        XCTAssert(mockNetwork!.isFetchDataCalled)
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
    
    func testCreationalSectionViewModelValues() {
        
        let information01 = Information.init(infoID: 101, name: "First Info", modified: "2018-01-22T23:00:00.0000000Z")
        let information02 = Information.init(infoID: 102, name: "Seconf Info", modified: "2018-01-22T23:00:00.0000000Z")
        let information03 = Information.init(infoID: 103, name: "Third Info", modified: "2018-01-22T23:00:00.0000000Z")

        let cellViewModel01 = CellViewModel.init(tab: information01)
        let cellViewModel02 = CellViewModel.init(tab: information02)
        let cellViewModel03 = CellViewModel.init(tab: information03)
        
        let listCells = [cellViewModel01, cellViewModel02, cellViewModel03]

        let sectionViewModel = SectionViewModel.init(title: "First Section", listTabs: listCells)
        
        XCTAssertNotNil(sectionViewModel)
        XCTAssert(cellViewModel01 === sectionViewModel.listTabs[0])
        XCTAssert(cellViewModel02 === sectionViewModel.listTabs[1])
        XCTAssert(cellViewModel03 === sectionViewModel.listTabs[2])
    }
}

class MockNetworkManager: NetworkManagerProtocol {
    
    var isFetchDataCalled = false
    
    var completeTabCategory: [TabCategory] = [TabCategory]()
    var completeClosure: ((Result<Array<TabCategory>>) -> ())!
    
    
    func fetchTabs(completion: @escaping (Result<Array<TabCategory>>) -> ()) {
        isFetchDataCalled = true
        completion(Result.error(.emptyData))
    }
    
    func fetchSuccess() {
        completeClosure(Result.results(completeTabCategory))
    }
    
    func fetchFail() {
        completeClosure(Result.error(.emptyData))
    }

}


