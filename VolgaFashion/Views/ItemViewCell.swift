//
//  ItemViewCell.swift
//  VolgaFashion
//
//  Created by Syngmaster on 14/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit
import FirebaseStorage

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToWishlistButton: UIButton!
    

    @IBAction func addToWishlistAction(_ sender: UIButton) {
        print("wishlist")
    }
    
    func configureCell(item:ItemModel) {
        itemNameLabel.text = item.itemName
        priceLabel.text = "\(item.itemPrice!)€"
        imageView.contentMode = .scaleAspectFill
        if item.isWishlisted {
            addToWishlistButton.setImage(UIImage(named:"addtowishlist_full_btn.png"), for: .normal)
        } else {
            addToWishlistButton.setImage(UIImage(named:"addtowishlist_empty_btn.png"), for: .normal)
        }
        let storage = FIRStorage.storage()
        let imageRef = storage.reference(forURL: item.photoArray.first!)
        
        imageRef.data(withMaxSize: 1*2048*2048) { (data, error) in
            
            if let data = data {
                let image = UIImage(data:data)
                self.imageView.image = image
            }
        }
    }
}
