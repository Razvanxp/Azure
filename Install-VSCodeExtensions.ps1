Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install terraform -y
choco install vscode -y

# Extensions
[array]$extensions = "hashicorp.terraform",
                     "mindginative.terraform-snippets"

foreach ($item in $extensions) {
   
    $command = "`"${env:ProgramFiles}\Microsoft VS Code\bin\code`" --install-extension $item --force"
    Start-Process 'cmd'-ArgumentList "/c $command" -Wait
}
