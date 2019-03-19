//
//  SectionViewModel.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class SectionViewModel {

    // MARK: - Properties
    
    var title : String
    var listTabs : [CellViewModel]!
    
    // MARK: - Init
    
    init(category: TabCategory) {
        self.title = category.title
        self.listTabs = parseTabsToViewModel(tabs: category.tabs)
    }
    
    init(title: String, listTabs: [CellViewModel]) {
        self.title = title
        self.listTabs = listTabs
    }
    
    // MARK: - Parser
    
    private func parseTabsToViewModel(tabs: [Information]) -> [CellViewModel] {
        var viewModels = [CellViewModel]()
        
        for tab in tabs {
            let cellVM = CellViewModel.init(tab: tab)
            viewModels.append(cellVM)
        }
        return viewModels
    }
}
