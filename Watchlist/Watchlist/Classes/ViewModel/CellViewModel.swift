//
//  CellViewModel.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class CellViewModel {
    
    // MARK: - Properties
    
    var tabId : Int!
    var name : String!
    var modified : String!
    
    // MARK: - Init
    
    init(tab: Information) {
        self.tabId = tab.infoID
        self.name = tab.name
        self.modified = getDateText(fromDate: tab.modified)
    }
    
    // MARK: - Date Formatter
    
    private func getDateText(fromDate: String) -> String {
        let date = fromDate.toDate(withFormat: dateFormat)
        let stringDate = date?.toString(withFormat: stringFormat)
        return stringDate!
    }
}
