//
//  ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/17/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class ViewController: UIViewController {
	
	var batteryLevel: Float {
		return UIDevice.current.batteryLevel
	}
	
	@objc func batteryStateDidChange(_ notification: Notification) {
		// State change
		// Reset message when plugged in
	}
	
	@objc func batteryLevelDidChange(_ notification: Notification) {
		// Level change
		// Play sound when < 10%, 5%, etc.
	}
	
	// Useful print state function
	func printState(_ state: Int) -> String {
		switch UIDevice.current.batteryState {
		case .charging:  return "Charging!"
		case .full:		 return "Full!"
		case .unknown:	 return "Unknown?"
		case .unplugged: return "Unplugged."
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		UIDevice.current.isBatteryMonitoringEnabled = true
		
		// Observers for level & state change
		NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange),
											   name: .UIDeviceBatteryStateDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange),
											   name: .UIDeviceBatteryLevelDidChange, object: nil)
		
		print("State: \(printState(UIDevice.current.batteryState.rawValue))")
		print("Level: \(UIDevice.current.batteryLevel)")
		
		
		// Draw a snazzy angled background
		// View color is defined here!
		let shape = CAShapeLayer()
		shape.fillColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
		view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
		
		let path = UIBezierPath()
		// The actual distance above above the bottom of the screen, including "angle"
		let bottomMargin = CGFloat(view.frame.size.height * 0.25)
		let marginGap = CGFloat(100)
		
		// Lines and math
		path.move(to: CGPoint(x: 0, y: view.frame.size.height))
		path.addLine(to: CGPoint(x: view.frame.size.width, y: view.frame.size.height))
		path.addLine(to: CGPoint(x: view.frame.size.width, y: view.frame.size.height - bottomMargin - marginGap))
		path.addLine(to: CGPoint(x: 0, y: view.frame.size.height - bottomMargin))
		path.close()
		shape.path = path.cgPath
		
		view.layer.addSublayer(shape)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

