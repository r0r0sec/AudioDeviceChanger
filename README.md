# AudioDeviceChanger

A PowerShell script with a CMD wrapper to easily switch between audio devices on Windows, utilizing `nircmd.exe`. Perfect for use with keyboard macros, hotkeys, or devices like a Stream Deck.

## Features

- Quickly toggle between two audio devices.
- Includes a CMD wrapper for seamless integration with macro systems or hotkey setups.
- Uses `nircmd.exe` for reliable audio device switching.
- Customizable to match your setup.

## Prerequisites

- Windows operating system.
- PowerShell 5.1 or later.
- `nircmd.exe` (provided in the repository).
- Renamed audio devices in Windows to match the script variables.

## Installation

1. Clone the repository or download the files directly:
   ```bash
   git clone https://github.com/r0r0sec/AudioDeviceChanger.git
   ```
2. Navigate to the directory where the files are located:
   ```bash
   cd AudioDeviceChanger
   ```

## Configuration

### Rename Audio Devices in Windows

For the script to work, your audio device names in Windows must match the values set in the script. To rename your audio devices:

1. Go to **Settings** → **System** → **Sound** → **Output**.
2. Click on your desired audio device and rename it, for example:
   - `Headphones`
   - `Speakers`
3. Update the script variables values if you use different names:
   ```powershell
   # Update these values in the script
   $AudioDevice_1 = "YourDevice1Name"
   $AudioDevice_2 = "YourDevice2Name"
   ```

## Usage

### Using the PowerShell Script (`AudioDeviceChanger.ps1`)

1. Open PowerShell in the script's directory.
2. Run the script or rightcklick "Run with PowerShell":
   ```powershell
   .\AudioDeviceChanger.ps1
   ```
3. The script will toggle between the two configured audio devices.

### Using the CMD Wrapper (`PSWrapper.cmd`)

1. Open a CMD interface in the script's directory.
2. Run the script or just double-click the file:
   ```cmd
   PSWrapper.cmd
   ```
3. The script will toggle between the two configured audio devices.

## Integration with Stream Deck or Macro Hotkeys
The `PSWrapper.cmd` file allows you to execute the script silently in the background, ideal for hotkeys or integration with devices like a Stream Deck.
In order to have the script run in the background, you can use the provided `nircmd.exe` and integrate it with the following command:

```plaintext
"..\AudioDeviceChanger\nircmd-x64\nircmd.exe" exec hide "..\AudioDeviceChanger\PSWrapper.cmd"
```

This will execute the script without bringing up any visible windows, ensuring a seamless user experience.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue if you have ideas for improvements or encounter any bugs.

## Third-Party Software

This project uses **NirCmd**, a freeware utility developed by NirSoft. NirCmd is licensed as freeware and can be freely distributed as long as no modifications are made to the original files.

For more information and to download the utility, visit: [https://www.nirsoft.net/utils/nircmd.html](https://www.nirsoft.net/utils/nircmd.html).

**Note**: The NirCmd files included in this project have not been modified in any way.

## Acknowledgments

- Thanks to NirSoft for the fantastic `nircmd.exe` utility.
