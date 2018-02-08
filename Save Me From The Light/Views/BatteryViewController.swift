//
//  BatteryView.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 2/3/18.
//  Copyright © 2018 UW. All rights reserved.
//

import UIKit

class BatteryViewController: UIViewController {
	
	override func viewWillAppear(_ animated: Bool) {
		
		//// Color Declarations
		let color1 = UIColor(red: 1.000, green: 0.314, blue: 0.316, alpha: 1.000)
		let color2 = UIColor(red: 0.942, green: 0.500, blue: 0.503, alpha: 1.000)
		let color3 = UIColor(red: 0.914, green: 0.754, blue: 0.753, alpha: 1.000)
		let color4 = UIColor(red: 0.423, green: 0.839, blue: 0.440, alpha: 1.000)
		
		//// Rectangle Drawing
		let rectanglePath = UIBezierPath(rect: CGRect(x: 15.5, y: 267.5, width: 86.5, height: 132))
		color1.setFill()
		rectanglePath.fill()
		
		
		//// Rectangle 3 Drawing
		let rectangle3Path = UIBezierPath(rect: CGRect(x: 102, y: 267, width: 87, height: 132))
		color2.setFill()
		rectangle3Path.fill()
		
		
		//// Rectangle 4 Drawing
		let rectangle4Path = UIBezierPath(rect: CGRect(x: 189, y: 267, width: 92, height: 132))
		color3.setFill()
		rectangle4Path.fill()
		
		
		//// Rectangle 5 Drawing
		let rectangle5Path = UIBezierPath(rect: CGRect(x: 281, y: 267.5, width: 74, height: 132))
		color4.setFill()
		rectangle5Path.fill()
		
		
		//// Rectangle 6 Drawing
		let rectangle6Path = UIBezierPath(rect: CGRect(x: 351, y: 318, width: 16, height: 31))
		color4.setFill()
		rectangle6Path.fill()
		
		
		//// Bezier Drawing
		let bezierPath = UIBezierPath()
		bezierPath.move(to: CGPoint(x: 349.87, y: 268.15))
		bezierPath.addLine(to: CGPoint(x: 350.25, y: 268.25))
		bezierPath.addCurve(to: CGPoint(x: 355.8, y: 273.81), controlPoint1: CGPoint(x: 352.83, y: 269.19), controlPoint2: CGPoint(x: 354.86, y: 271.23))
		bezierPath.addCurve(to: CGPoint(x: 356.54, y: 282.79), controlPoint1: CGPoint(x: 356.54, y: 276.18), controlPoint2: CGPoint(x: 356.54, y: 278.38))
		bezierPath.addCurve(to: CGPoint(x: 356.54, y: 318), controlPoint1: CGPoint(x: 356.54, y: 282.79), controlPoint2: CGPoint(x: 356.54, y: 298.71))
		bezierPath.addLine(to: CGPoint(x: 358.89, y: 318))
		bezierPath.addCurve(to: CGPoint(x: 363.16, y: 318.33), controlPoint1: CGPoint(x: 361.08, y: 318), controlPoint2: CGPoint(x: 362.18, y: 318))
		bezierPath.addLine(to: CGPoint(x: 363.36, y: 318.37))
		bezierPath.addCurve(to: CGPoint(x: 366.13, y: 321.16), controlPoint1: CGPoint(x: 364.64, y: 318.85), controlPoint2: CGPoint(x: 365.66, y: 319.86))
		bezierPath.addCurve(to: CGPoint(x: 366.5, y: 325.64), controlPoint1: CGPoint(x: 366.5, y: 322.34), controlPoint2: CGPoint(x: 366.5, y: 323.44))
		bezierPath.addLine(to: CGPoint(x: 366.5, y: 342.36))
		bezierPath.addCurve(to: CGPoint(x: 366.17, y: 346.65), controlPoint1: CGPoint(x: 366.5, y: 344.56), controlPoint2: CGPoint(x: 366.5, y: 345.66))
		bezierPath.addLine(to: CGPoint(x: 366.13, y: 346.84))
		bezierPath.addCurve(to: CGPoint(x: 363.36, y: 349.63), controlPoint1: CGPoint(x: 365.66, y: 348.14), controlPoint2: CGPoint(x: 364.64, y: 349.15))
		bezierPath.addCurve(to: CGPoint(x: 358.89, y: 350), controlPoint1: CGPoint(x: 362.18, y: 350), controlPoint2: CGPoint(x: 361.08, y: 350))
		bezierPath.addLine(to: CGPoint(x: 356.54, y: 350))
		bezierPath.addCurve(to: CGPoint(x: 356.54, y: 385.21), controlPoint1: CGPoint(x: 356.54, y: 369.29), controlPoint2: CGPoint(x: 356.54, y: 385.21))
		bezierPath.addCurve(to: CGPoint(x: 355.89, y: 393.8), controlPoint1: CGPoint(x: 356.54, y: 389.62), controlPoint2: CGPoint(x: 356.54, y: 391.82))
		bezierPath.addLine(to: CGPoint(x: 355.8, y: 394.19))
		bezierPath.addCurve(to: CGPoint(x: 350.25, y: 399.75), controlPoint1: CGPoint(x: 354.86, y: 396.77), controlPoint2: CGPoint(x: 352.83, y: 398.81))
		bezierPath.addCurve(to: CGPoint(x: 341.32, y: 400.5), controlPoint1: CGPoint(x: 347.89, y: 400.5), controlPoint2: CGPoint(x: 345.7, y: 400.5))
		bezierPath.addLine(to: CGPoint(x: 27.72, y: 400.5))
		bezierPath.addCurve(to: CGPoint(x: 19.17, y: 399.85), controlPoint1: CGPoint(x: 23.34, y: 400.5), controlPoint2: CGPoint(x: 21.15, y: 400.5))
		bezierPath.addLine(to: CGPoint(x: 18.79, y: 399.75))
		bezierPath.addCurve(to: CGPoint(x: 13.25, y: 394.19), controlPoint1: CGPoint(x: 16.21, y: 398.81), controlPoint2: CGPoint(x: 14.18, y: 396.77))
		bezierPath.addCurve(to: CGPoint(x: 12.5, y: 385.21), controlPoint1: CGPoint(x: 12.5, y: 391.82), controlPoint2: CGPoint(x: 12.5, y: 389.62))
		bezierPath.addLine(to: CGPoint(x: 12.5, y: 282.79))
		bezierPath.addCurve(to: CGPoint(x: 13.15, y: 274.2), controlPoint1: CGPoint(x: 12.5, y: 278.38), controlPoint2: CGPoint(x: 12.5, y: 276.18))
		bezierPath.addLine(to: CGPoint(x: 13.25, y: 273.81))
		bezierPath.addCurve(to: CGPoint(x: 18.79, y: 268.25), controlPoint1: CGPoint(x: 14.18, y: 271.23), controlPoint2: CGPoint(x: 16.21, y: 269.19))
		bezierPath.addCurve(to: CGPoint(x: 27.72, y: 267.5), controlPoint1: CGPoint(x: 21.15, y: 267.5), controlPoint2: CGPoint(x: 23.34, y: 267.5))
		bezierPath.addLine(to: CGPoint(x: 341.32, y: 267.5))
		bezierPath.addCurve(to: CGPoint(x: 349.87, y: 268.15), controlPoint1: CGPoint(x: 345.7, y: 267.5), controlPoint2: CGPoint(x: 347.89, y: 267.5))
		bezierPath.close()
		UIColor.black.setStroke()
		bezierPath.lineWidth = 3
		bezierPath.stroke()
		
		let newLayer = CAShapeLayer()
		
		newLayer.path = bezierPath.cgPath
		self.view.layer.addSublayer(newLayer)
	}
	
}
