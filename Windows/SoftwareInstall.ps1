# Make sure the Microsoft App Installer is installed:
# https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1
# Need to run as Administrator

# Winget
$apps = @(
    @{name = "Adobe.Acrobat.Reader.64-bit", version = "" },
    @{name = "Chocolatey.ChocolateyGUI", version = "" },
    @{name = "Google.Chrome", version = "" },
    @{name = "Dropbox.Dropbox", version = "" },
    @{name = "Logitech.OptionsPlus", version = "" },
    @{name = "Microsoft.PowerShell", version = "" },
    @{name = "Microsoft.PowerToys", version = "" },
    @{name = "Microsoft.WindowsTerminal", version = "" },
    @{name = "Spotify.Spotify", version = "" },
    @{name = "VideoLAN.VLC", version = "" },
    @{name = "WhatsApp.WhatsApp", version = "" },
    @{name = "Git.Git", version = "" },
    @{name = "GitHub.GitHubDesktop", version = "" },
    @{name = "SublimeHQ.SublimeText.4", version = "" },
    @{name = "SublimeHQ.SublimeMerge", version = "" },
    @{name = "JetBrains.Toolbox", version = "" },
    @{name = "JetBrains.PHPStorm", version = "" },
    @{name = "Postman.Postman", version = "" },
    @{name = "PuTTY.PuTTY", version = "" },
    @{name = "7zip.7zip", version = "" },
    @{name = "JAMSoftware.TreeSize", version = "" },
    @{name = "DEVCOM.JetBrainsMonoNerdFont", version = "" },
    @{name = "Samsung.Dex", version = "" },
    @{name = "CoreyButler.NVMforWindows", version = "" },
    @{name = "WinSCP.WinSCP", version = "" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        if ([string]::IsNullOrEmpty($app.version)) {
            winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
        } else {
            winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name -v $app.version
        }
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

# Powershell 
Install-Module Terminal-Icons -Scope CurrentUser
Install-Module -Name devtoolbox
Install-Module PSReadLine -RequiredVersion 2.2.2 -Force