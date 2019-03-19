//
//  TableViewController.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "InfoTableViewCell"

class TableViewController: UITableViewController {

    // MARK: - Properties

    private let viewModel = TableViewModel()
    
    // MARK: - Setups

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIView()
    }
    
    private func setupUIView() {
        setupNavigationItems()
    }
    
    private func setupNavigationItems() {
        navigationItem.titleView = LogoHelper().setupLogo()
    }
    
    // MARK: - Fetch Data
    
    private func fetchData() {
        viewModel.fetchListCategories()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TableViewCell

        // Configure the cell...

        return cell
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



