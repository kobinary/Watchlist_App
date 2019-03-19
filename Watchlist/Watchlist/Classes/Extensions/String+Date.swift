//
//  String+Date.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit
import Foundation

// MARK: - Date Format

let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
let stringFormat = "EEE, MMM dd, yyyy - HH:mm"
let timeZone = "UTC"

extension String {
    
    // MARK: - Transform String to Date
    
    func toDate(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: timeZone) as TimeZone?
        let date = dateFormatter.date(from: self)
        
        return date
    }
}

extension Date {
    
    // MARK: - Transform Date to String
    
    func toString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: timeZone) as TimeZone?
        let strMonth = dateFormatter.string(from: self)
        
        return strMonth
    }
}
