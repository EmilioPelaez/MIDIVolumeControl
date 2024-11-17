//
//  MIDIVolumeControlApp.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 15/11/24.
//

import SwiftUI

@main
struct MIDIVolumeControlApp: App {
	@State var controller = VolumeController()
	
	var body: some Scene {
		MenuBarExtra("MIDI Volume", systemImage: "slider.horizontal.2.square") {
			ConfigurationEditor(configuration: $controller.configuration)
		}
	}
}
