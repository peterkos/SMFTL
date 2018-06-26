//
//  SoundPack.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 5/5/18.
//  Copyright © 2018 UW. All rights reserved.
//

import UIKit

protocol ASoundPackViewController {
	var packNumber: UILabel! {get set}
	var packName: UILabel! {get set}
	var backgroundColor: UIColor? {get set}
	var tintColor: UIColor? {get set}
	var textColor: UIColor? {get set}
}
