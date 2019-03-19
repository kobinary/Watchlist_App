//
//  TableViewModel.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

protocol TableViewModelDelegate: class {
    func reloadTable()
}

class TableViewModel {

    // MARK: - Properties
    
    private var manager: NetworkManager?
    weak var delegate: TableViewModelDelegate?
    var sections = [SectionViewModel]()
    private var fullContent : [SectionViewModel]!

    // MARK: - Init
    
    init() {
        manager = NetworkManager()
    }
    
    // MARK: - Fetcher
    
    func fetchListCategories() {
        guard let manager = manager else { return }
        let searchURL = manager.tabsURLFromParameters()
        
        manager.fetchTabs(searchURL) { [weak self] (results) in
            guard let self = self else { return }
            
            switch results {
            case .error(let error) :
                print("Error Fetching Data: \(error)")
                break
            case .results(let data):
                self.sections = self.parseListCategoryIntoViewModel(array: data)
                self.saveFullContent(content: self.sections)
                self.checkOrientation()
                self.delegate?.reloadTable()
            }
        }
    }
    
    // MARK: - Parser
    
    private func parseListCategoryIntoViewModel(array: Array<Category>) -> [SectionViewModel] {
        var sectionsVM : [SectionViewModel] = []
        
        for category in array {
            let sectionVM = SectionViewModel.init(category: category)
            sectionsVM.append(sectionVM)
        }
        return sectionsVM
    }
    
    // MARK: - Device Orientation Logic
    
    func saveFullContent(content:  [SectionViewModel]) {
        self.fullContent = content
    }
    
    func checkOrientation() {
        if UIDevice.current.orientation.isLandscape {
            didRotateToLandscape()
        } else {
            didRotateToPortrait()
        }
    }
    
    func didRotateToLandscape() {
        sections = filterData()
    }
    
    func didRotateToPortrait() {
        sections = fullContent
    }
    
    // MARK: - Filter Sections
    
    func filterData() -> [SectionViewModel] {
        var filteredSections = [SectionViewModel]()
        for section in sections {
            let filteredTabs = section.listTabs.filter { $0.infoID % 2  == 0 }
            let filteredSection = SectionViewModel.init(title: section.title, listTabs: filteredTabs)
            filteredSections.append(filteredSection)
        }
        return filteredSections
    }

}
