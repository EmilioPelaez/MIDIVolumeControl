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
//		Form {
		List {
			Section("MIDI Volume Control") {
				Toggle("Enabled", isOn: $configuration.enabled)
			}
			Section("Configuration") {
				Stepper(value: $configuration.minValue) {
					LabeledContent("Min", value: "\(configuration.minValue)")
				}
				Stepper(value: $configuration.maxValue) {
					LabeledContent("Max", value: "\(configuration.maxValue)")
				}
				Stepper(value: $configuration.deadZone) {
					LabeledContent("Dead Zone", value: "\(configuration.deadZone)")
				}
			}
			.labeledContentStyle(.horizontal)
			
			Button("Quit") {
				NSApplication.shared.terminate(nil)
			}
			.keyboardShortcut("q")
		}
		.formStyle(.grouped)
		.listStyle(.sidebar)
	}
}

#Preview {
	@Previewable @State var configuration: VolumeController.Configuration = .init()
	ConfigurationEditor(configuration: $configuration)
		.padding()
}
