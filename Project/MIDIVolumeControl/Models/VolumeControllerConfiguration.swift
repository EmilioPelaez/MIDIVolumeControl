//
//  VolumeControllerConfiguration.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

import Foundation

extension VolumeController {
	struct Configuration {
		var enabled: Bool = false
		var minValue: Int = 0
		var maxValue: Int = 127
		var deadZone: Int = 6
	}
}

extension VolumeController.Configuration {
	enum Keys: String {
		case enabled, minValue, maxValue, deadZone
	}
	
	init(from defaults: UserDefaults) {
		let enabled = defaults.object(forKey: Keys.enabled.rawValue) as? Bool
		let minValue = defaults.object(forKey: Keys.minValue.rawValue) as? Int
		let maxValue = defaults.object(forKey: Keys.maxValue.rawValue) as? Int
		let deadZone = defaults.object(forKey: Keys.deadZone.rawValue) as? Int
		
		self.init(enabled: enabled ?? false,
							minValue: minValue ?? 0,
							maxValue: maxValue ?? 127,
							deadZone: deadZone ?? 6)
	}
	
	func persist(to defaults: UserDefaults) {
		defaults.set(enabled, forKey: Keys.enabled.rawValue)
		defaults.set(minValue, forKey: Keys.minValue.rawValue)
		defaults.set(maxValue, forKey: Keys.maxValue.rawValue)
		defaults.set(deadZone, forKey: Keys.deadZone.rawValue)
	}
}
