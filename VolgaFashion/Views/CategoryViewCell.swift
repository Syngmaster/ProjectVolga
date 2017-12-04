//
//  CategoryViewCell.swift
//  VolgaFashion
//
//  Created by Syngmaster on 16/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell(row: Int) {
        
        self.imageView.image = UIImage(named:"1448.jpg")

        
    }
    
}
