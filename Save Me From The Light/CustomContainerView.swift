//
//  CustomContainerView.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/5/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit

class CustomContainerView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		customInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		customInit()
	}
	
	private func customInit() {
		let layerMask = CAShapeLayer()
		layerMask.fillColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
		layerMask.path = customPath().cgPath
		self.layer.addSublayer(layerMask)
		
		self.layer.mask = layerMask
	}
	
	func customPath() -> UIBezierPath {
		
		let path = UIBezierPath()
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
