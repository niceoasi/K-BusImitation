//
//  ViewController.swift
//  K-BusImitation
//
//  Created by Daeyun Ethan Kim on 13/08/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ViewController
class ViewController: UIViewController {

    // MARK: Properties
        // constants
    let kBNBSLTVCellID = "BusNBusStopListTableViewCell"
    let kFMCVCellID = "FastMenuCollectionViewCell"
    let kHambugerSegue = "HambugerMenuSegue"
    
    // MARK: Outlets
    @IBOutlet weak var bNBSLTableView: UITableView?
    @IBOutlet weak var fMCollectionView: UICollectionView?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
        // add nibs
        let bNBSLTVCellNib = UINib(nibName: kBNBSLTVCellID, bundle: nil)
        bNBSLTableView?.register(bNBSLTVCellNib, forCellReuseIdentifier: kBNBSLTVCellID)
        
        let fMCVCellNib = UINib(nibName: kFMCVCellID, bundle: nil)
        fMCollectionView?.register(fMCVCellNib, forCellWithReuseIdentifier: kFMCVCellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openMenu(_ sender: Any) {
        performSegue(withIdentifier: kHambugerSegue, sender: nil)
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var modalWindow:UIWindow = UIWindow(frame: self.view.window!.bounds)
        
        modalWindow.backgroundColor = UIColor.black.withAlphaComponent(0.66)
        modalWindow.isHidden = false
        modalWindow.windowLevel = (UIWindowLevelStatusBar + 1)
        
//        let view =
//        modalWindow.addSubview(customView)
        
        modalWindow.makeKeyAndVisible()
    }
}

// MARK: ViewController: UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kBNBSLTVCellID, for: indexPath) as? BusNBusStopListTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

// MARK: ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kFMCVCellID, for: indexPath) as? FastMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}
