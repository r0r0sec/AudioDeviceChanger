# your audio devices in windows have to match the values set in $AudioDevice_1 and $AudioDevice_2
# rename your audio devices under Windows accordingly
# go to: Settings -> Sound -> Output

# audio device names
$AudioDevice_1 = "Headphones"
$AudioDevice_2 = "Speakers"

# path to nircmd.exe
$NirCmd = "$PSScriptRoot\nircmd-x64\nircmd.exe"

# arguments for "nircmd.exe" (reference https://nircmd.nirsoft.net/setdefaultsounddevice.html)
# arguments for audio device 1
$Args_AudioDevice_1_Multimedia = "setdefaultsounddevice `"$AudioDevice_1`" 1" # Multimedia
$Args_AudioDevice_1_Communications = "setdefaultsounddevice `"$AudioDevice_1`" 2" # Communications

# arguments for audio device 2
$Args_AudioDevice_2_Multimedia = "setdefaultsounddevice `"$AudioDevice_2`" 1" # Multimedia
$Args_AudioDevice_2_Communications = "setdefaultsounddevice `"$AudioDevice_2`" 2" # Communications

# custom registry key for the active audio device setting
$RegKey = "HKCU:\Software\AudioDeviceSetting"
$RegName = "ActiveDevice"
$RegValue = "$AudioDevice_1"

# create registry key if not present
if ( -not (Test-Path -Path $RegKey) )
{
	New-Item -Path $RegKey
	New-ItemProperty -Path $RegKey -Name $RegName -Value $RegValue
}

# get the active audio device from the registry and switch accordingly
$ActiveAudioDevice = Get-ItemProperty -Path $RegKey -Name $RegName
Write-Host "$($ActiveAudioDevice.$RegName)"
Switch ( $($ActiveAudioDevice.$RegName) )
{
	# switch from audio device 1 to audio device 2 and update the registry key
	$AudioDevice_1 {
	Start-Process -FilePath $NirCmd -ArgumentList $Args_AudioDevice_2_Multimedia
	Start-Process -FilePath $NirCmd -ArgumentList $Args_AudioDevice_2_Communications
	New-ItemProperty -Path $RegKey -Name $RegName -Value $AudioDevice_2 -Force | Out-Null
	}

	# switch from audio device 2 to audio device 1 and update the registry key
	$AudioDevice_2 {
	Start-Process -FilePath $NirCmd -ArgumentList $Args_AudioDevice_1_Multimedia
	Start-Process -FilePath $NirCmd -ArgumentList $Args_AudioDevice_1_Communications
	New-ItemProperty -Path $RegKey -Name $RegName -Value $AudioDevice_1 -Force | Out-Null
	}
}