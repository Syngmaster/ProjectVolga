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
        
    }


    @objc func searchAction(sender: UIBarButtonItem) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryViewCell
        
        cell.imageView.image = UIImage(named:"1448.jpg")
    
        // Configure the cell
    
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.row {
            
        case 0: return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
        case 1: return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
        case 2: return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/2)
        case 3: return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
        case 4: return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
        case 5: return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/2)

        default:
            return .zero
        }
        
    }

    // MARK: UICollectionViewDelegate
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "list", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "list" {
            let dvc = segue.destination as! ItemsListViewController
            dvc.navTitle = "CLOTHING"
        }
    }

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
