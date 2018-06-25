//
//  ReminderData.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 6/22/18.
//  Copyright © 2018 UW. All rights reserved.
//

import Foundation



class ReminderData {
	
	var sliderNumber: Float
	var enabled: Bool
	
	init(sliderNumber: Float, enabled: Bool) {
		self.sliderNumber = sliderNumber
		self.enabled = enabled
	}
	
	// TODO: Store using NSUserDefaults
	
}
