//
//  PriceLabel.swift
//  VolgaFashion
//
//  Created by Syngmaster on 15/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class PriceLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.black
        textColor = UIColor(red: 255.0/255.0, green: 153.0/255.0, blue: 204.0/255.0, alpha: 1.0)
    }
}
