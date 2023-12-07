# Parameter Definitions
Param(
    [Parameter(Mandatory=$True)]
    [string]$ApiURL,

    [Parameter(Mandatory=$True)]
    [string]$SubscriptionKey,

    [Parameter(Mandatory=$True)]
    [string]$FilePath
)

# Examples:
# .\Export_QnA_CLU.ps1 -ApiURL "https://lanuage-rc.cognitiveservices.azure.com/language/authoring/query-knowledgebases/projects/QnA-Test/:export?stringIndexType=Utf16CodeUnit&api-version=2023-04-01&format=json" -SubscriptionKey "d1234c456d789" -FilePath "C:\Workspace\qna.json"
 
Write-Host ApiURL: $ApiURL
Write-Host SubscriptionKey: $SubscriptionKey
Write-Host FilePath: $FilePath

$result1 = Invoke-WebRequest -Method POST -Uri $ApiURL -UseBasicParsing -Headers @{'Ocp-Apim-Subscription-Key' = $SubscriptionKey}

$counter = 1
Write-Host Start of While loop with counter=$counter
while ($counter -ne -1 -and $counter -ne 10)
{
	Write-Host Inside of While loop with counter=$counter
	Start-Sleep -Seconds 3.0
	
	Write-Host Start Status-Request
	$response_status = Invoke-WebRequest -Method GET -Uri $result1.Headers.'operation-location' -UseBasicParsing -Headers @{'Ocp-Apim-Subscription-Key' = $SubscriptionKey}
	$status = $response_status.Content | ConvertFrom-Json
	
	Write-Host Response: $status
	Write-Host Status: $status.status
	Write-Host resultUrl: $status.resultUrl
	
	if ($status.status -match "succeeded") {
		$counter = -1
		$response_export = Invoke-WebRequest -Method GET -Outfile $FilePath -Uri $status.resultUrl -UseBasicParsing -Headers @{'Ocp-Apim-Subscription-Key' = $SubscriptionKey}
	}
	else {
		$counter++
	}
}
Write-Host End of While loop
