//
//  MessageCell.swift
//  FamilyPlanner
//
//  Created by Julia Will on 12.01.16.
//  Copyright © 2016 Julia Will. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    override func drawRect(rect: CGRect) {
        drawOwnCell(frame: rect)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func drawOwnCell(frame frame: CGRect = CGRectMake(0, 0, 240, 120)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Color Declarations
        let gradientColor = UIColor(red: 0.841, green: 0.965, blue: 0.960, alpha: 1.000)
        let gradientColor2 = UIColor(red: 0.923, green: 1.000, blue: 0.984, alpha: 1.000)
        
        //// Gradient Declarations
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [gradientColor.CGColor, gradientColor2.CGColor], [0, 1])!
        
        //// Rectangle Drawing
        let rectangleRect = CGRectMake(frame.minX + 51, frame.minY + 5, 184, 110)
        let rectanglePath = UIBezierPath(roundedRect: rectangleRect, cornerRadius: 5)
        CGContextSaveGState(context)
        rectanglePath.addClip()
        CGContextDrawLinearGradient(context, gradient,
            CGPointMake(rectangleRect.midX, rectangleRect.minY),
            CGPointMake(rectangleRect.midX, rectangleRect.maxY),
            CGGradientDrawingOptions())
        CGContextRestoreGState(context)
    }
}