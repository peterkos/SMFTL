//
//  ReminderData.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 6/22/18.
//  Copyright © 2018 UW. All rights reserved.
//

import Foundation


class AlertData: NSObject, Codable {
	
	var sliderNumber: Float
	var enabled: Bool
	
	override var description: String {
		return "slider: \(sliderNumber), enabled: \(enabled)"
	}
	
	init(sliderNumber: Float, enabled: Bool) {
		self.sliderNumber = sliderNumber
		self.enabled = enabled
	}
	
	convenience override init() {
		self.init(sliderNumber: 0.5, enabled: true)
	}
	
	
	
}
