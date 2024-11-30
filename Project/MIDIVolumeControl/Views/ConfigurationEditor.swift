//
//  ConfigurationEditor.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

import SwiftUI

public struct ConfigurationEditor: View {
	@Binding var configuration: VolumeController.Configuration
	let lastValue: Float?
	
	public var body: some View {
		Section("MIDI Volume Control") {
			Toggle("Enabled", isOn: $configuration.enabled)
		}
		Section("Configuration") {
			Stepper("Dead Zone: \(configuration.deadZone)", value: $configuration.deadZone, step: 3)
			Menu("Curve: \(configuration.curve.description)") {
				ForEach(Curve.Kind.allCases) { curve in
					if curve == .linear {
						Button(curve.description) {
							configuration.curve = .init(kind: .linear, easing: .easeInOut)
						}
					} else {
						Menu(curve.description) {
							ForEach(Curve.Easing.allCases) { easing in
								Button(easing.description) {
									configuration.curve = .init(kind: curve, easing: easing)
								}
							}
						}
					}
				}
			}
			if let lastValue {
					Text("Last Value: ")
					+ Text("\(lastValue.formatted(.number.precision(.fractionLength(2))))")
						.fontDesign(.monospaced)
			}
		}
		Button("Quit") {
			NSApplication.shared.terminate(nil)
		}
		.keyboardShortcut("q")
	}
}

#Preview {
	@Previewable @State var configuration: VolumeController.Configuration = .init()
	ConfigurationEditor(configuration: $configuration, lastValue: 0.5)
		.padding()
}
