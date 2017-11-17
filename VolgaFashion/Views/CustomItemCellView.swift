//
//  CustomItemCellView.swift
//  VolgaFashion
//
//  Created by Syngmaster on 15/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class CustomItemCellView: UIView {


    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.6
    }
    
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//        let context = UIGraphicsGetCurrentContext()
//        context?.setLineWidth(1)
//        context?.move(to: CGPoint(x: rect.minX, y: rect.minY))
//        context?.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        context?.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        context?.setStrokeColor(UIColor.black.cgColor)
//        context?.strokePath()
//
//
//    }

}
