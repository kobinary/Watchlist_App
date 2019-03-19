//
//  Result.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import Foundation

enum Result<ResultType> {
    case results(ResultType)
    case error(Error)
}

enum Error {
    case noConnection
    case noData
    case emptyData
    case genericError
}
