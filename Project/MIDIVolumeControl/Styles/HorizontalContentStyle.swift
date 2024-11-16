//
//  HorizontalContentStyle.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 16/11/24.
//

import SwiftUI

struct HorizontalContentStyle: LabeledContentStyle {
	func makeBody(configuration: Configuration) -> some View {
		HStack(alignment: .firstTextBaseline) {
			configuration.label
			Spacer()
			configuration.content
				.bold()
		}
	}
}

extension LabeledContentStyle where Self == HorizontalContentStyle {
	 static var horizontal: Self { .init() }
}
