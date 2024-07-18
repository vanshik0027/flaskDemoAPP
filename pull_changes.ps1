# Set execution policy to Bypass for the current process
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Define the repository path and branch name
$repositoryPath = "C:\Users\vansh\flaskAppDemo\flaskDemoAPP"
$branchName = "main"

# Define the interval (in seconds) and duration (in hours)
$interval = 60  # 1 minute
$duration = 8  # 8 hours

# Calculate the end time
$endTime = (Get-Date).AddHours($duration)

# Function to pull changes from the Git branch
function Pull-Changes {
    Write-Host "Pulling changes from $branchName..."
    cd $repositoryPath
    git pull origin $branchName
}

# Run the pull operation every interval until the end time
while ((Get-Date) -lt $endTime) {
    Pull-Changes
    Start-Sleep -Seconds $interval
}

Write-Host "Completed pulling changes every $interval seconds for $duration hours."
