//
//  ConfigurationEditor.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

import SwiftUI

public struct ConfigurationEditor: View {
	@Binding var configuration: VolumeController.Configuration
	
	public var body: some View {
		Section("MIDI Volume Control") {
			Toggle("Enabled", isOn: $configuration.enabled)
		}
		Section("Configuration") {
			Stepper("Dead Zone: \(configuration.deadZone)", value: $configuration.deadZone, step: 3)
		}
		Button("Quit") {
			NSApplication.shared.terminate(nil)
		}
		.keyboardShortcut("q")
	}
}

#Preview {
	@Previewable @State var configuration: VolumeController.Configuration = .init()
	ConfigurationEditor(configuration: $configuration)
		.padding()
}
