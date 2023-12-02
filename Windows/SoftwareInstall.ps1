# Make sure the Microsoft App Installer is installed:
# https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1
# Need to run as Administrator

# Winget
$apps = @(
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Chocolatey.ChocolateyGUI" },
    @{name = "Google.Chrome" },
    @{name = "Dropbox.Dropbox" },
    @{name = "Logitech.OptionsPlus" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.PowerToys" },
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "Spotify.Spotify" },
    @{name = "VideoLAN.VLC" },
    @{name = "WhatsApp.WhatsApp" },
    @{name = "Git.Git" },
    @{name = "GitHub.GitHubDesktop" },
    @{name = "SublimeHQ.SublimeText.4" },
    @{name = "SublimeHQ.SublimeMerge" },
    @{name = "JetBrains.Toolbox" },
    @{name = "JetBrains.PHPStorm" },
    @{name = "Postman.Postman" },
    @{name = "PuTTY.PuTTY" },
    @{name = "7zip.7zip" },
    @{name = "JAMSoftware.TreeSize" },
    @{name = "DEVCOM.JetBrainsMonoNerdFont" },
    @{name = "Samsung.Dex" },
    @{name = "WinSCP.WinSCP" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
    } else {
        Write-host "Skipped: " $app.name " (already installed)"
    }
}

# Chocolatey
# Install chocolatey-cli
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$apps = @(
    @{name = "starship" },
    @{name = "terminal-icons.powershell" },
    @{name = "sysinternals" }
);
Foreach ($app in $apps) {
    $listApp = choco search $app.name --local-only

    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        choco install $app.name
    } else {
        Write-host "Skipped: " $app.name " (already installed)"
    }
}
