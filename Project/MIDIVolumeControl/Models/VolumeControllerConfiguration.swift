//
//  VolumeControllerConfiguration.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

extension VolumeController {
	struct Configuration {
		var enabled: Bool = true
		var minValue: Int = 0
		var maxValue: Int = 127
		var deadZone: Int = 6
	}
}
