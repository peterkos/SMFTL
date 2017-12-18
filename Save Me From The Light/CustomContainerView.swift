//
//  CustomContainerView.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/5/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit

class CustomContainerView: UIView {

	private let shapeFillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		// Set background color
		// TODO: manually changing background color doesn't work?
		// 		 See https://stackoverflow.com/a/23593656
		
		// Draw a snazzy angled background
		self.backgroundColor = UIColor.white
		
		let shape = CAShapeLayer()
		shape.fillColor = shapeFillColor.cgColor
		shape.path = customPath().cgPath
		self.layer.addSublayer(shape)
		
	}
	
	func customPath() -> UIBezierPath {
		
		let path = UIBezierPath()
		// The actual distance above the bottom of the screen, including "angle"
		let bottomMargin =  CGFloat(frame.size.height * 0.20)
		let marginGap = CGFloat(100)
		
		path.move(to: CGPoint(x: 0, y: frame.size.height))
		path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
		path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height - bottomMargin - marginGap))
		path.addLine(to: CGPoint(x: 0, y: frame.size.height - bottomMargin))
		path.close()
		
		return path
	}

}
