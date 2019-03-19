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
    private weak var activityIndicatorView: UIActivityIndicatorView!

    // MARK: - Setups

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupUIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }

    private func setupUIView() {
        setupNavigationItems()
        setupSpinner()
    }
    
    private func setupNavigationItems() {
        navigationItem.titleView = LogoHelper().setupLogo()
    }
    
    private func setupSpinner() {
        let activityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        tableView.backgroundView = activityIndicatorView
        self.activityIndicatorView = activityIndicatorView
    }
    
    // MARK: - Fetch Data
    
    private func fetchData() {
        activityIndicatorView.startAnimating()
        viewModel.fetchListCategories()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].listTabs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TableViewCell
        let cellViewModel = viewModel.sections[indexPath.section].listTabs[indexPath.row]
        cell.update(viewModel: cellViewModel)
        return cell
    }
    
    // MARK: - Table view Header
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].title
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as? UITableViewHeaderFooterView)?.textLabel?.textColor = UIColor.Blue()
    }
    
    // MARK: - Device Orientation
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        viewModel.checkOrientation()
        self.tableView.reloadData()
    }
}


// MARK: - TableViewModel delegate

extension TableViewController: TableViewModelDelegate {
    
    func reloadTable() {
        DispatchQueue.main.sync {
            self.activityIndicatorView.stopAnimating()
            self.tableView.reloadData()
        }
    }
}



