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
	
	@IBInspectable var shapeFillColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		//setup your view with the settings
	}
	
    override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		// Set background color
		// TODO: manually changing background color doesn't work?
		// 		 See https://stackoverflow.com/a/23593656
		UIColor.white.setFill()
		UIRectFill(rect)
		
		// Draw a snazzy angled background
		let shape = CAShapeLayer()
//		shape.fillColor = shapeFillColor.cgColor
		shape.fillColor = nil
		

		// Lines and math
		shape.path = Constants(withViewFrame: self.frame).path.cgPath

		// TODO: Move to external method?
		// Review draw() paradigms!
		self.layer.addSublayer(shape)

    }

}
