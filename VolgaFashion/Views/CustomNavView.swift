//
//  CustomNavView.swift
//  VolgaFashion
//
//  Created by Syngmaster on 13/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class CustomNavView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
         context?.setLineWidth(1)
         context?.move(to: CGPoint(x: rect.minX, y: rect.maxY))
         context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
         context?.setStrokeColor(UIColor.gray.cgColor)
         context?.strokePath()
        
    }
 

}
