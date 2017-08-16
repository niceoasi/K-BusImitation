//
//  HambugerMenuTableViewCell.swift
//  K-BusImitation
//
//  Created by Daeyun Ethan Kim on 13/08/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - HambugerMenuTableViewCell
class HambugerMenuTableViewCell: UITableViewCell {

    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var topLineView: UIView?
    @IBOutlet weak var bottomLineView: UIView?
    @IBOutlet weak var menuImageView: UIImageView?
    @IBOutlet weak var menuLabel: UILabel?
    
    
    // MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(lineColor: UIColor? = nil, backgroundColor: UIColor? = nil, image: UIImage? = nil, menuText: String, textColor: UIColor = .black) {
        if let lineColor = lineColor {
            topLineView?.backgroundColor = lineColor
            bottomLineView?.backgroundColor = lineColor
        }
        
        if let backgroundColor = backgroundColor {
            contentView.backgroundColor = backgroundColor
        }
        
        if let image = image {  // 나중에 옵셔널 없애기
            menuImageView?.image = image
        }
        
        menuLabel?.text = menuText
        menuLabel?.textColor = textColor
    }
}
