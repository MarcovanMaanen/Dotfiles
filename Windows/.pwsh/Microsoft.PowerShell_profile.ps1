[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding


Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

New-Alias g goto

function goto {
    param (
        $location
    )

    Switch ($location) {
        "pr" {
            Set-Location -Path "$HOME/projects"
        }
        default {
            echo "Invalid location"
        }
    }
}

$ENV:STARSHIP_CONFIG = "$HOME\.starship\starship.toml"
$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp"
Invoke-Expression (&starship init powershell)
