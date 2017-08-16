//
//  HambugerMenuViewController.swift
//  K-BusImitation
//
//  Created by Daeyun Ethan Kim on 13/08/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// constant swift 파일로 옮길 것
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

// MARK: - HambugerMenuViewController
class HambugerMenuViewController: UIViewController {

    // MARK: Properties
        // constants
    let kAnimateDuration = 1.0
    let kHMTVCellID = "HambugerMenuTableViewCell"
    let kHMTVHeaderViewID = "HambugerMenuTableViewHeaderView"
    let kHMTVFooterViewID = "HambugerMenuTableViewFooterView"
    
    let menuText = [["Log in required"], ["Bus Arrival Notification", "City", "Edit Home"], ["Notices", "Settings"], ["Import from SeoulBus"], ["Kakao Metro", "Kakao Maps", "Kakao Taxi", "Kakao Navi", "Kakao Driver"]]
    
    // MARK: Outlets
    @IBOutlet weak var leadingConstraintForHambugerMenu: NSLayoutConstraint?
    @IBOutlet weak var hMTableView: UITableView?
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showView()
    }
    
    func setView() {
        
        // add nibs
        let hMTVCellNib = UINib(nibName: kHMTVCellID, bundle: nil)
        hMTableView?.register(hMTVCellNib, forCellReuseIdentifier: kHMTVCellID)
        
        let headrViewNib = UINib(nibName: kHMTVHeaderViewID, bundle: nil)
        hMTableView?.register(headrViewNib, forCellReuseIdentifier: kHMTVHeaderViewID)
        
        let footerViewNib = UINib(nibName: kHMTVFooterViewID, bundle: nil)
        hMTableView?.register(footerViewNib, forCellReuseIdentifier: kHMTVFooterViewID)
        
        leadingConstraintForHambugerMenu?.constant = -(kScreenWidth - 100)
        view.layoutIfNeeded()
    }
    
    /*
    func setMenuView() {
        // add nibs
        leadingConstraintForHambugerMenu?.constant = -(kScreenWidth - 100)
        view.layoutIfNeeded()
    }
    */

    func showView() {
        UIView.animate(withDuration: kAnimateDuration) { 
            self.leadingConstraintForHambugerMenu?.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func hideView() {
        UIView.animate(withDuration: kAnimateDuration, animations: {
            self.leadingConstraintForHambugerMenu?.constant = -(kScreenWidth - 100)
            self.view.layoutIfNeeded()
        }) { (flag) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Actions
    @IBAction func closeViewAction(_ sender: Any) {
        hideView()
    }
    
}

// MARK: HambugerMenuViewController: UI
extension HambugerMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed(kHMTVHeaderViewID, owner: self, options: nil)?.first as? HambugerMenuTableViewHeaderView
        
        switch section {
        case 0:
            headerView?.configureView(headerBackgroundColor: .white, lineColor: .white, lineHeight: 1.0)
        case 1:
            headerView?.configureView(headerBackgroundColor: .white, lineColor: UIColor(hexString: "#BBBBBB"), lineHeight: 0.5)
        case 2:
            headerView?.configureView(headerBackgroundColor: .white, lineColor: UIColor(hexString: "#E8E8E8"), lineHeight: 0.5)
        case 3:
            headerView?.configureView(headerBackgroundColor: UIColor(hexString: "#F8F8F8"), lineColor: UIColor(hexString: "#E8E8E8"), lineHeight: 0.5)
        case 4:
            headerView?.configureView(headerBackgroundColor: UIColor(hexString: "#F8F8F8"), lineColor: UIColor(hexString: "#F8F8F8"), lineHeight: 0.5)
        default:
            headerView?.configureView(headerBackgroundColor: .white, lineColor: .white, lineHeight: 1.0)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = Bundle.main.loadNibNamed(kHMTVFooterViewID, owner: self, options: nil)?.first as? HambugerMenuTableViewFooterView
        
        switch section {
        case 0:
            footerView?.configureView(footerBackgroundColor: .white, lineColor: UIColor(hexString: "#BBBBBB"), lineHeight: 0.5)
        case 1:
            footerView?.configureView(footerBackgroundColor: .white, lineColor: UIColor(hexString: "#E8E8E8"), lineHeight: 0.5)
        case 2:
            footerView?.configureView(footerBackgroundColor: .white, lineColor: UIColor(hexString: "#E8E8E8"), lineHeight: 0.5)
        case 3:
            footerView?.configureView(footerBackgroundColor: UIColor(hexString: "#F8F8F8"), lineColor: UIColor(hexString: "#F8F8F8"), lineHeight: 0.5)
        case 4:
            footerView?.configureView(footerBackgroundColor: UIColor(hexString: "#F8F8F8"), lineColor: UIColor(hexString: "#F8F8F8"), lineHeight: 0.5)
        default:
            footerView?.configureView(footerBackgroundColor: .white, lineColor: .white, lineHeight: 1.0)
        }
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 2
        case 3:
            return 1
        case 4:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kScreenHeight / 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kHMTVCellID, for: indexPath) as? HambugerMenuTableViewCell else {
            return UITableViewCell()
        }
        let text = menuText[indexPath.section][indexPath.row]
        
        switch indexPath.section {
        case 0:
            cell.configureCell(menuText: text, textColor: UIColor(hexString: "#7D7D7D"))
            cell.isUserInteractionEnabled = false
        case 3:
            cell.configureCell(lineColor: UIColor(hexString: "#E8E8E8"), menuText: text)
        case 4:
            cell.configureCell(backgroundColor: UIColor(hexString: "#F8F8F8"), menuText: text, textColor: UIColor(hexString: "#7D7D7D"))
        default:
            cell.configureCell(menuText: text)
        }
        
        return cell
    }
}
