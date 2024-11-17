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
		var deadZone: Int = 6
	}
}

extension VolumeController.Configuration {
	enum Keys: String {
		case enabled, deadZone
	}
	
	init(from defaults: UserDefaults) {
		let enabled = defaults.object(forKey: Keys.enabled.rawValue) as? Bool
		let deadZone = defaults.object(forKey: Keys.deadZone.rawValue) as? Int
		
		let base = VolumeController.Configuration()
		
		self.init(enabled: enabled ?? base.enabled,
							deadZone: deadZone ?? base.deadZone)
	}
	
	func persist(to defaults: UserDefaults) {
		defaults.set(enabled, forKey: Keys.enabled.rawValue)
		defaults.set(deadZone, forKey: Keys.deadZone.rawValue)
	}
}
