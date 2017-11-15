//
//  DividerLabel.swift
//  VolgaFashion
//
//  Created by Syngmaster on 14/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class DividerLabel: UILabel {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(0.8)
        context?.move(to: CGPoint(x: rect.minX, y: rect.midY))
        context?.addLine(to: CGPoint(x: rect.midX - 25, y: rect.midY))
        context?.move(to: CGPoint(x: rect.midX + 25, y: rect.midY))
        context?.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.strokePath()
        
        super.drawText(in: rect)
        
    }
 

}
