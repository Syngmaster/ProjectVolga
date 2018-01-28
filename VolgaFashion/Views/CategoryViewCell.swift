//
//  CategoryViewCell.swift
//  VolgaFashion
//
//  Created by Syngmaster on 16/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit
import FirebaseStorage

class CategoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: ItemTitleLabel!
    
    func configureCell(category: Category, row: Int) {
    
        categoryLabel.text = category.categoryTitle
        
        let storage = FIRStorage.storage()
        let imageRef = storage.reference(forURL: category.categoryPhoto)
        
        imageRef.data(withMaxSize: 1*1024*1024) { (data, error) in

            if let data = data {
                let image = UIImage(data:data)
                self.imageView.image = image
            }

        }
        
    }
    
}
