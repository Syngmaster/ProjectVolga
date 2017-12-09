//
//  CategoryModel.swift
//  VolgaFashion
//
//  Created by Syngmaster on 05/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class Category {
    
    var categoryTitle: String
    var categoryPhoto: UIImage
    
    init(photoURL: String, title: String) {
        categoryTitle = title
        categoryPhoto = photoURL
        
        }


}
