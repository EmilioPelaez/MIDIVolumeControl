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
		var curve: Curve = .init(kind: .linear, easing: .easeInOut)
	}
}

extension VolumeController.Configuration {
	enum Keys: String {
		case enabled, deadZone, curve, easing
	}
	
	init(from defaults: UserDefaults) {
		let enabled = defaults.object(forKey: Keys.enabled.rawValue) as? Bool
		let deadZone = defaults.object(forKey: Keys.deadZone.rawValue) as? Int
		let curveKind = defaults.string(forKey: Keys.curve.rawValue)
		let curveEasing = defaults.string(forKey: Keys.easing.rawValue)
		
		let curve: Curve?
		if let curveKind,
			 let kind = Curve.Kind(rawValue: curveKind),
			 let curveEasing,
			 let easing = Curve.Easing(rawValue: curveEasing) {
			curve = .init(kind: kind, easing: easing)
		} else {
			curve = nil
		}
		
		let base = VolumeController.Configuration()
		
		self.init(enabled: enabled ?? base.enabled,
							deadZone: deadZone ?? base.deadZone,
							curve: curve ?? base.curve)
	}
	
	func persist(to defaults: UserDefaults) {
		defaults.set(enabled, forKey: Keys.enabled.rawValue)
		defaults.set(deadZone, forKey: Keys.deadZone.rawValue)
		defaults.set(curve.kind.rawValue, forKey: Keys.curve.rawValue)
		defaults.set(curve.easing.rawValue, forKey: Keys.easing.rawValue)
	}
}
