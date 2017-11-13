//
//  CustomButton.swift
//  VolgaFashion
//
//  Created by Syngmaster on 13/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }

}
