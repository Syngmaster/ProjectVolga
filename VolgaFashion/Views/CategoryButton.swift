//
//  CategoryButton.swift
//  VolgaFashion
//
//  Created by Syngmaster on 13/11/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit

class CategoryButton: UIButton {
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.borderWidth = 0.6
//    }

    override func draw(_ rect: CGRect) {
        super.draw(rect);

        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2)

        switch self.tag {
        case 0:
            context?.move(to: CGPoint(x: rect.minX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            context?.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        case 1:
            context?.move(to: CGPoint(x: rect.minX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            context?.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        case 2:
            context?.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        case 3:
            context?.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        case 4:
            context?.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            context?.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        default:break

        }
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.strokePath()
    }

}
