//
//  ItemsListViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 14/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ItemsListViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var navTitle:String?
    var selectedCell:UICollectionViewCell?
    var arrayOfItems:[ItemModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: self, action: #selector(searchAction(sender:)))
        searchBarButton.tintColor = UIColor.black
        navigationItem.rightBarButtonItem = searchBarButton
        if let navTitle = navTitle {
            navigationItem.title = navTitle
        } else {
            navigationItem.title = "SALE"
        }
        navigationItem.backBarButtonItem?.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        DataManager.sharedInstance.downloadItems(category: "MEN", subcategory: navTitle!) { (result) in
            
            print("result - \(result)")
            self.arrayOfItems = result as? [ItemModel]
            self.collectionView?.reloadData()
        }
    }
    
    @objc func searchAction(sender: UIBarButtonItem) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let arrayOfItems = arrayOfItems {
            return arrayOfItems.count
        } else {
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemViewCell
        
//        cell.imageView.image = UIImage(named:"item_photo.jpg")
//        cell.imageView.contentMode = .scaleAspectFill
//        cell.itemNameLabel.text = "VINTAGE 80S JACKET"
//        cell.priceLabel.text = "€400"
        
        let item = arrayOfItems![indexPath.row]
        cell.configureCell(item: item)
        cell.addToWishlistButton.imageView?.image = UIImage(named:"addtowishlist_empty_btn.png")
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2.6)

    }
    

    // MARK: UICollectionViewDelegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let dvc = segue.destination as! ItemDetailsViewController
            if let item = sender as? ItemModel {
                dvc.selectedItem = item
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = arrayOfItems[indexPath.row]
        selectedCell = collectionView.cellForItem(at: indexPath)
        collectionView.deselectItem(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "details", sender: item)
        
    }

}
