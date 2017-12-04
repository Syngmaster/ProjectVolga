//
//  CategoryButton.swift
//  VolgaFashion
//
//  Created by Syngmaster on 13/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class CustomSimpleButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 1.0
    }

}
