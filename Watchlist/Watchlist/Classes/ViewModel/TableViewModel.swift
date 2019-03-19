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
    
}
