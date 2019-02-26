//
//  DashboardViewController.swift
//  RNTravels
//
//  Created by Harish on 21/02/19.
//  Copyright © 2019 PACTS. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var optionActive: UILabel!
    @IBOutlet weak var optionFollowing: UILabel!
    @IBOutlet weak var optionPast: UILabel!
    
    @IBOutlet weak var followBtnContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tableData0:[Int]=[11,12,13,14]
    var tableData1:[Int]=[21,22,23,24]
    var tableData2:[Int]=[31,32,33,34]
    
    var collectionCellIndex:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isPagingEnabled = true
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DashboardCollectionViewCell
        
        let tableView = cell.tableView
        tableView?.delegate = self
        tableView?.dataSource = self
        collectionCellIndex = indexPath.item
        setupOptionFont()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height:view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func setupOptionFont(){
        switch collectionCellIndex {
        case 1:
            optionActive.textColor = .white
            optionPast.textColor = .white
            optionFollowing.textColor = .green
        case 2:
            optionActive.textColor = .white
            optionPast.textColor = .green
            optionFollowing.textColor = .white
        default:
            optionActive.textColor = .green
            optionPast.textColor = .white
            optionFollowing.textColor = .white
            
        }
        
    }
}

extension DashboardViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PkgTableCell", for: indexPath) as! PackageTableViewCell
        
        switch collectionCellIndex {
            
        case 1:
            cell.packageLabel.text = String(tableData1[indexPath.item])
        case 2:
            cell.packageLabel.text = String(tableData2[indexPath.item])
        default:
            cell.packageLabel.text = String(tableData0[indexPath.item])
            
        }
        return cell
    }
}
