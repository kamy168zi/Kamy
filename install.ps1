param(
  [ValidateSet("claude", "openclaw")]
  [string]$Target = "claude",
  [string]$SkillRoot = ""
)

$ErrorActionPreference = "Stop"

$zipUrl = "https://raw.githubusercontent.com/kamy168zi/Kamy/main/releases/gongzhonghao-typeset-skill-20260525.zip"
$zipPath = Join-Path $env:TEMP "gongzhonghao-typeset-skill.zip"

if ($SkillRoot -ne "") {
  $skillRoot = $SkillRoot
} elseif ($Target -eq "openclaw") {
  $skillRoot = Join-Path $HOME ".openclaw\skills"
} else {
  $skillRoot = Join-Path $HOME ".claude\skills"
}

New-Item -ItemType Directory -Force -Path $skillRoot | Out-Null

Write-Host "Downloading gongzhonghao-typeset..."
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

Write-Host "Installing to $skillRoot..."
Expand-Archive -Path $zipPath -DestinationPath $skillRoot -Force

Write-Host ""
Write-Host "Install complete:"
Write-Host (Join-Path $skillRoot "gongzhonghao-typeset")
Write-Host ""
Write-Host "Restart Claude / Codex / OpenClaw, then ask it to use gongzhonghao-typeset."
