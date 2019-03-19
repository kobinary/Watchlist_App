//
//  LogoHelper.swift
//  Watchlist
//
//  Created by Maria Ortega on 19/03/2019.
//  Copyright © 2019 Maria Ortega. All rights reserved.
//

import UIKit

class LogoHelper {

    // MARK: - Properties

    private let icon = "logoIcon.png"
    
    // MARK: - Setup Logo
    
    func setupLogo() -> UIImageView {
        let logo = UIImage(named: icon)
        let imageView = UIImageView(image:logo)
        return imageView
    }
}
