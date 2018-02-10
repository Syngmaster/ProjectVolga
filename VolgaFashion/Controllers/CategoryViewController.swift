//
//  CategoryViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 16/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CategoryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var navTitle:String?
    var category:String?
    var arrayOfCategories = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let searchBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(searchAction(sender:)))
        searchBarButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = searchBarButton
        if let navTitle = navTitle {
            navigationItem.title = navTitle
        }
        navigationItem.backBarButtonItem?.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        DataManager.sharedInstance.downloadSubCategories(category:navTitle!) { (array) in
            self.arrayOfCategories = array
            self.collectionView?.reloadData()
        }
        
    }


    @objc func searchAction(sender: UIBarButtonItem) {
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfCategories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryViewCell
        
        let category = arrayOfCategories[indexPath.row] as! Category
        
        cell.configureCell(category: category, row: indexPath.row)

        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellSize:CGSize = .zero
        
        indexPath.row%3 == 0 ?
            (cellSize =  CGSize(width: collectionView.frame.width, height: collectionView.frame.height/2)) :
            (cellSize = CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2))
        
        return cellSize
        
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let category = arrayOfCategories[indexPath.row]
        self.performSegue(withIdentifier: "list", sender: category)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "list" {
            let dvc = segue.destination as! ItemsListViewController
            let sender = sender as! Category
            dvc.navTitle = sender.categoryTitle
            dvc.category = navTitle
        }
    }

}
