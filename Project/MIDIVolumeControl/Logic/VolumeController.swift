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
	
	var midiReceiver: MIDIReceiver?
	var task: Task<Void, Never>?
	
	init(defaults: UserDefaults = .standard) {
		self.defaults = defaults
		self.configuration = .init(from: defaults)
		
		configureStream()
	}
	
	func configureStream() {
		if configuration.enabled && midiReceiver == nil {
			let receiver = MIDIReceiver()
			task = Task {
				for await value in receiver.values {
					receiveValue(value)
				}
			}
			midiReceiver = receiver
		} else if !configuration.enabled {
			midiReceiver = nil
			task?.cancel()
			task = nil
		}
	}
	
	func receiveValue(_ value: Int) {
		let newVolume = convertValue(value)
		Sound.output.volume = newVolume
	}
	
	func convertValue(_ value: Int) -> Float {
		let deadZone = Float(configuration.deadZone)
		let min = deadZone
		let max = 127 - deadZone
		guard min < max else { return 0 }
		let remapped = Float(value).remap(from: (min, max), to: (0, 1))
		let clamped = remapped.clamped()
		return clamped
	}
}
