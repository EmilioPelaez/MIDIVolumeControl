//
//  VolumeController.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

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
		fatalError()
	}
}
