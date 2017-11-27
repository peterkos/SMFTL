//
//  ColoredView.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/26/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit

@IBDesignable
class ColoredView: UIView {
	
    override func draw(_ rect: CGRect) {
		
		// Draw a snazzy angled background
		// View color is defined here!
		let shape = CAShapeLayer()
		self.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
		shape.fillColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)

		let path = UIBezierPath()
		// The actual distance above the bottom of the screen, including "angle"
		let bottomMargin = CGFloat(self.frame.size.height * 0.25)
		let marginGap = CGFloat(100)

		// Lines and math
		path.move(to: CGPoint(x: 0, y: self.frame.size.height))
		path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
		path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height - bottomMargin - marginGap))
		path.addLine(to: CGPoint(x: 0, y: self.frame.size.height - bottomMargin))
		path.close()
		shape.path = path.cgPath

		self.layer.addSublayer(shape)

    }

}
