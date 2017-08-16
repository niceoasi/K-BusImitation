//
//  HambugerMenuTableViewHeaderView.swift
//  K-BusImitation
//
//  Created by Daeyun Ethan Kim on 14/08/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - HambugerMenuTableViewHeaderView
class HambugerMenuTableViewHeaderView: UITableViewHeaderFooterView {

    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var heightConstraintsForLine: NSLayoutConstraint?
    @IBOutlet weak var lineView: UIView?
    @IBOutlet weak var headerBackgroundView: UIView?
    
    
    // MARK: Init
    func configureView(headerBackgroundColor: UIColor, lineColor: UIColor, lineHeight: CGFloat) {
        headerBackgroundView?.backgroundColor = headerBackgroundColor
        lineView?.backgroundColor = lineColor
        heightConstraintsForLine?.constant = lineHeight
        
        layoutIfNeeded()
    }
}
