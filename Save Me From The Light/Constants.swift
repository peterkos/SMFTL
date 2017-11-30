//
//  Constants.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/29/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit


// Various things that are needed in the app across classes.
// Temporary solution until the proper way to use the draw method is figured out
struct Constants {
	
	// View for view modifying
	var currentViewFrame: CGRect
	
	// Path of classy bottom shape
	let path = UIBezierPath()
	
	// The actual distance above the bottom of the screen, including "angle"
	let bottomMargin: CGFloat
	let marginGap: CGFloat
	
	init(withViewFrame frame: CGRect) {
		currentViewFrame = frame
		bottomMargin =  CGFloat(currentViewFrame.size.height * 0.20)
		marginGap = CGFloat(100)
		
		configurePath()
	}

	// The drawing of the fun shape on the bottom
	func configurePath() {
		path.move(to: CGPoint(x: 0, y: currentViewFrame.size.height))
		path.addLine(to: CGPoint(x: currentViewFrame.size.width, y: currentViewFrame.size.height))
		path.addLine(to: CGPoint(x: currentViewFrame.size.width, y: currentViewFrame.size.height - bottomMargin - marginGap))
		path.addLine(to: CGPoint(x: 0, y: currentViewFrame.size.height - bottomMargin))
		path.close()
	}

}
