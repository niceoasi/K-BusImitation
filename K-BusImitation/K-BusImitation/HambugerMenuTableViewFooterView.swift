//
//  HambugerMenuTableViewFooterView.swift
//  K-BusImitation
//
//  Created by Daeyun Ethan Kim on 14/08/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - HambugerMenuTableViewFooterView
class HambugerMenuTableViewFooterView: UITableViewHeaderFooterView {

    // MARK: Properties
    @IBOutlet weak var footerBackgroundView: UIView?
    @IBOutlet weak var lineView: UIView?
    @IBOutlet weak var heightConstraintsForLine: NSLayoutConstraint?
    
    // MARK: Outlets
    
    
    // MARK: Init
    func configureView(footerBackgroundColor: UIColor, lineColor: UIColor, lineHeight: CGFloat) {
        footerBackgroundView?.backgroundColor = footerBackgroundColor
        lineView?.backgroundColor = lineColor
        heightConstraintsForLine?.constant = lineHeight
        
        layoutIfNeeded()
    }

}
