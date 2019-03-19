//
//  TableViewCell.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var infoID: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!

    // MARK: - Setups
    
    func update(viewModel: CellViewModel) {
        self.infoID.text = "\(String(describing: viewModel.infoID ?? 0))"
        self.name.text = viewModel.name
        self.date.text = viewModel.date
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
