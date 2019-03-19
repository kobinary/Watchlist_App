//
//  NetworkManager.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit
import Foundation

protocol NetworkManagerProtocol {
    func fetchTabs(completion: @escaping (Result<Array<TabCategory>>) -> () )
}

class NetworkManager: NetworkManagerProtocol {

    // MARK: - URL Data
    
    private func tabsURLFromParameters() -> URL {
        
        // Build base URL
        var components = URLComponents()
        components.scheme = Constants.TabsURLParams.APIScheme
        components.host = Constants.TabsURLParams.APIHost
        components.path = Constants.TabsURLParams.APIPath
        
        // Build query string
        components.queryItems = [URLQueryItem]()
        
        // Query components
        components.queryItems!.append(URLQueryItem(name: Constants.TabsAPIKeys.alt, value: Constants.TabsAPIValues.alt))
        components.queryItems!.append(URLQueryItem(name: Constants.TabsAPIKeys.token, value: Constants.TabsAPIValues.token))
        
        return components.url!
    }
    
    // MARK: - Fetch Data
    
    func fetchTabs(completion: @escaping (Result<Array<TabCategory>>) -> () ) {
        let session = URLSession.shared
        let request = URLRequest(url: tabsURLFromParameters())
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if (error == nil) {
                
                // Check response code
                let status = (response as! HTTPURLResponse).statusCode
                if (status < 200 || status > 300) {
                    completion(Result.error(.noConnection))
                }
                
                // Check data
                guard let data = data else {
                    completion(Result.error(.noData))
                    return
                }
                
                // Parse the Data
                let jsonData: [String:AnyObject]!
                do {
                    jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
                } catch {
                    completion(Result.error(.noData))
                    return
                }
                
                // Check for Watchlist Tabs
                guard let watchlistTabs = jsonData[Constants.TabsAPIValues.watchlistTabs] as? [[String: AnyObject]] else {
                    completion(Result.error(.emptyData))
                    return
                }
                
                // Check if there is coming data
                if watchlistTabs.count == 0 {
                    completion(Result.error(.emptyData))
                } else {
                    let listTabs = Parser.parseListTabs(array: watchlistTabs)
                    completion(Result.results(listTabs))
                }
            }
            else {
                completion(Result.error(.genericError))
            }
        }
        task.resume()
    }
}
