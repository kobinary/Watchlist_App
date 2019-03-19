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
    
    var infoID : Int!
    var name : String!
    var date : String!
    
    // MARK: - Init
    
    init(tab: Information) {
        self.infoID = tab.infoID
        self.name = tab.name
        self.date = getDateText(fromDate: tab.modified)
    }
    
    // MARK: - Date Formatter
    
    private func getDateText(fromDate: String) -> String {
        let date = fromDate.toDate(withFormat: dateFormat)
        let stringDate = date?.toString(withFormat: stringFormat)
        return stringDate!
    }
}
