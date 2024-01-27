# Define the path to the CSV file
$csvFilePath = "C:\Users\User\Desktop\Files\addresses.csv"
 
# Read the IP addresses from the CSV file
$ipAddresses = Import-Csv -Path $csvFilePath | Select-Object -ExpandProperty IPAddress
 
# Define the password for the key
$keyPassword = "YourPassword"
 
# Loop through each IP address
foreach ($ip in $ipAddresses) {
    # Construct the curl command with embedded password
    $curlCommand = "curl.exe -k --verbose --cert C:/Users/User/Desktop/Files/sample.crt.pem --key C:/Users/User/Desktop/Files/sample.key --pass $keyPassword -F 'FQDN=proxy.sample.com' -F 'PORT=81' -F 'NTP=10.10.10.10' -F 'FORCE=true' --trace-ascii true https://$ip/cgi-bin/update-network.py"
 
    # Execute the curl command
    Invoke-Expression $curlCommand
 
}
 
# Script ends after looping through all IPs
