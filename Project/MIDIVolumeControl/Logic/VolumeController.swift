//
//  VolumeController.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

import CGMath
import Foundation
import ISSoundAdditions
import SnoizeMIDI

@Observable
class VolumeController {
	
	let defaults: UserDefaults
	
	var configuration: Configuration {
		didSet {
			configuration.persist(to: defaults)
			configureStream()
		}
	}
	
	init(defaults: UserDefaults = .standard) {
		self.defaults = defaults
		self.configuration = .init(from: defaults)
		
		configureStream()
	}
	
	func configureStream() {
		if configuration.enabled {
			//	Enable Stream
		} else {
			//	Disable Stream
		}
	}
	
	func receiveValue(_ value: Int) {
		let newVolume = convertValue(value)
		Sound.output.volume = newVolume
	}
	
	func convertValue(_ value: Int) -> Float {
		let min = Float(configuration.minValue + configuration.deadZone)
		let max = Float(configuration.maxValue - configuration.deadZone)
		guard min < max else { return 0 }
		let remapped = Float(value).remap(from: (min, max), to: (0, 1))
		let clamped = remapped.clamped()
		return clamped
	}
}
