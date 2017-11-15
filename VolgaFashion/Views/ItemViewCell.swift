//
//  ItemViewCell.swift
//  VolgaFashion
//
//  Created by Syngmaster on 14/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class ItemViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToWishlistButton: UIButton!
    @IBAction func addToWishlistAction(_ sender: UIButton) {
        
    }
    
}
