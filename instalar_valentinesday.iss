[Setup]
AppName=Valentinesday
AppVersion=1.0
DefaultDirName={pf}\Valentinesday
DefaultGroupName=Valentinesday
OutputDir=.
OutputBaseFilename=ValentinesdaySetup
Compression=lzma
SolidCompression=yes

[Files]
Source: "C:\Users\dell-g15-hanz\Desktop\Release\*"; DestDir: "{app}"; Flags: recursesubdirs

[Icons]
Name: "{commondesktop}\Valentinesday"; Filename: "{app}\valentines_day.exe"