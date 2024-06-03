##################################################
## Add 127.0.0.1 app.localhost to your HOSTS file
##################################################

# Define the URL and the interval for requests
$url = "http://app.localhost"
$intervalSeconds = 1  # Interval between checks in seconds

# Function to perform the HTTP GET request
function Check-WebsiteStatus {
    try {
        # Send HTTP GET request
        $response = Invoke-WebRequest -Uri $url -Method Get -TimeoutSec 10 -Headers @{"Host"="app.localhost"}
        
        # Output the response content if successful
        Write-Output "$(Get-Date) - Success: [$($response.StatusCode) $($response.StatusDescription)] - $url"
        Write-Output $response.Content  # This line can be commented out if only the status is needed
    }
    catch {
        # Output error details if the request fails
        Write-Output "$(Get-Date) - Error: Failed to reach $url. Exception: $($_.Exception.Message)"
    }
}

# Infinite loop to continuously check the status
Write-Output "Starting to monitor $url every $intervalSeconds seconds..."
while ($true) {
    Check-WebsiteStatus
    Start-Sleep -Seconds $intervalSeconds
}
