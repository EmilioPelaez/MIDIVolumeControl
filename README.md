# MIDIVolumeControl 🎚️

**MIDIVolumeControl** is a macOS utility that listens to MIDI device signals and maps them to control the system volume.

---

## Features
- 🎚️ **Real-time MIDI Input:** Connect your MIDI device and control macOS system volume.
- 🖥️ **Lightweight and Efficient:** Built for macOS with minimal system resource usage.

---

## Requirements
- macOS 14.0 Sonoma or later.
- A MIDI device that supports Control Change (CC) messages.
- Swift 5+ and Xcode for building from source (optional).

---

## Installation

### Using Pre-built Binary
1. Download the latest release from the [Releases](https://github.com/EmilioPelaez/MIDIVolumeControl/releases) page.
1. Open the `.zip` file and drag the app to your Applications folder.
1. Launch the app and enable from the menu bar.
1. Optional: Add to Login items in System Settings

### Build from Source
1. Clone the repository: `$ git clone https://github.com/EmilioPelaez/MIDIVolumeControl.git`
1. Fetch project submodules.
1. Open `MIDIVolumeControl.xcodeproj` in Xcode.
1. Build and run the project.

## Usage
1. Connect your MIDI device to your Mac.
1. Launch MIDIVolumeControl.
1. Use your MIDI controller to adjust the Mac system volume.

## Dependencies
- [MIDIApps](https://github.com/krevis/MIDIApps) by @krevis does all the heavy lifting of receiving the MIDI messages
- [ISSoundAdditions](https://github.com/InerziaSoft/ISSoundAdditions) by @InerziaSoft is used to set the system volume