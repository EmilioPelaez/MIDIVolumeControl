//
//  MIDIReceiver.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

import SnoizeMIDI

@Observable
class MIDIReceiver: NSObject {
	
	let context: MIDIContext
	let portStream: PortInputStream
	
	var availableSources: Set<InputStreamSource> {
		portStream.inputSourcesSet
	}
	
	var selectedSource: InputStreamSource? {
		get {
			portStream.selectedInputSources.first
		}
		set {
			portStream.selectedInputSources = Set([newValue].compactMap { $0 })
		}
	}
	
	override init() {
		let context = MIDIContext()
		self.context = context
		self.portStream = .init(midiContext: context)
		
		super.init()
		
		portStream.delegate = self
		portStream.messageDestination = self
		
		selectedSource = portStream.inputSources.first
	}
}

extension MIDIReceiver: InputStreamDelegate {
	func inputStreamReadingSysEx(_ stream: InputStream, byteCountSoFar: Int, streamSource: InputStreamSource) {}
	
	func inputStreamFinishedReadingSysEx(_ stream: InputStream, byteCount: Int, streamSource: InputStreamSource, isValid: Bool) {}
	
	func inputStreamSourceListChanged(_ stream: InputStream) {
		guard selectedSource == nil else {
			return
		}
		selectedSource = availableSources.first
	}
}

extension MIDIReceiver: MessageDestination {
	func takeMIDIMessages(_ messages: [Message]) {
		print(#function, messages)
	}
}
