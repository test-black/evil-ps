# Execute the following to remove the elevated persistent payload
schtasks /Delete /TN Updater
# Execute the following to remove the user-level persistent payload
Remove-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Run\ -Name Updater
