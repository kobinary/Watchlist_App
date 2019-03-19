//
//  Constants.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

struct Constants {
    
    // MARK: - Tabs API Constants
    
    struct TabsURLParams {
        static let APIScheme = "https"
        static let APIHost = "firebasestorage.googleapis.com"
        static let APIPath = "/v0/b/testtask01-c5746.appspot.com/o/TabList.json"
    }
    
    struct TabsAPIKeys {
        static let alt = "alt"
        static let token = "token"
    }
    
    struct TabsAPIValues {
        static let alt = "media"
        static let token = "e99cf91c-d5ce-40b1-8632-7089c4ced96a"
        static let watchlistTabs = "WatchlistTabs"
    }
    
    // MARK: - Model Keys Constants
    
    struct TabModelKeys {
        static let id = "TabId"
        static let name = "TabName"
        static let modified = "LastModified"
    }
    
    struct CategoryModelKeys {
        static let id = "Id"
        static let title = "Title"
        static let tabs = "Tabs"
    }
}
