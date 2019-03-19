//
//  Parser.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class Parser {

    // MARK: - Parse API Data
    
    static func parseListTabs(array: [[String: AnyObject]]) -> Array<Category> {
        var arrayCategories = Array<Category>()
        
        for listTabs in array {
            if let listID = listTabs[Constants.CategoryModelKeys.id] as? Int,
                let title = listTabs[Constants.CategoryModelKeys.title] as? String,
                let tabs = listTabs[Constants.CategoryModelKeys.tabs] as? [[String: AnyObject]] {
                
                let tabsModel = parseTabs(tabs: tabs)
                let category = Category.init(categoryID: listID, title: title, tabs: tabsModel)
                arrayCategories.append(category)
            }
        }
        return arrayCategories.sorted(by: { $0.categoryID < $1.categoryID })
    }
    
    private static func parseTabs(tabs: [[String: AnyObject]]) -> Array<Information> {
        var arrayTabs = Array<Information>()
        
        for tab in tabs {
            if let tabID = tab[Constants.TabModelKeys.id] as? Int,
                let name = tab[Constants.TabModelKeys.name] as? String,
                let modified = tab[Constants.TabModelKeys.modified] as? String {
                let tabModel = Information.init(infoID: tabID, name: name, modified: modified)
                arrayTabs.append(tabModel)
            }
        }
        return arrayTabs.sorted(by: { $0.infoID < $1.infoID })
    }
}
