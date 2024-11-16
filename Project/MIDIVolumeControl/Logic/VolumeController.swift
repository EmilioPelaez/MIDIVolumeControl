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
		}
	}
	
	init(defaults: UserDefaults = .standard) {
		self.defaults = defaults
		self.configuration = .init(from: defaults)
	}
	
}
