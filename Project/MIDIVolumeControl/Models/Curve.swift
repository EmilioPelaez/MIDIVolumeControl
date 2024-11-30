//
//  Curve.swift
//  MIDIVolumeControl
//
//  Created by Emilio Peláez on 11/30/24.
//

import Easing

struct Curve: CustomStringConvertible {
	var kind: Kind
	var easing: Easing
	
	var function: (Float) -> Float {
		guard let curve = kind.curve else { return { $0 } }
		switch easing {
		case .easeIn: return curve.easeIn
		case .easeOut: return curve.easeOut
		case .easeInOut: return curve.easeInOut
		}
	}
	
	var description: String {
		if kind == .linear { return kind.description }
		return "\(kind.description) \(easing.description)"
	}
}

extension Curve {
	enum Kind: String, CaseIterable, Identifiable, CustomStringConvertible {
		var id: Self { self }
		
		case linear, sine, quad, cubic, quart
		
		var description: String {
			rawValue.capitalized
		}
	}
	
	enum Easing: String, CaseIterable, Identifiable, CustomStringConvertible {
		var id: Self { self }
		
		case easeIn, easeOut, easeInOut
		
		var description: String {
			switch self {
			case .easeIn: "Ease In"
			case .easeOut: "Ease Out"
			case .easeInOut: "Ease In Out"
			}
		}
	}
}

extension Curve.Kind {
	var curve: Easing.Curve<Float>? {
		switch self {
		case .linear: .none
		case .sine: .sine
		case .quad: .quadratic
		case .cubic: .cubic
		case .quart: .quartic
		}
	}
}
