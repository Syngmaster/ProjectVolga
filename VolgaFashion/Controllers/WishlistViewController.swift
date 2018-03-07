//
//  WishlistViewController.swift
//  VolgaFashion
//
//  Created by Syngmaster on 13/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class WishlistViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    var arrayOfItems:[ItemModel]!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func startShoppingAction(_ sender: UIButton) {
        tabBarController?.selectedIndex = 0
    }
}

extension WishlistViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let arrayOfItems = arrayOfItems {
            return arrayOfItems.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WishlistViewCell

        
        let item = arrayOfItems![indexPath.row]
        cell.configureCell(item: item)
        
        return cell
    }
    
}

extension WishlistViewController: UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2.6)
        
    }
    
}
