# Parameter Definitions
Param(
    [Parameter(Mandatory=$True)]
    [string]$ApiURL,

    [Parameter(Mandatory=$True)]
    [string]$SubscriptionKey
)

# Examples:
#.\Train_CLU.ps1 -ApiURL "https://lanuage-rc.cognitiveservices.azure.com/language/authoring/analyze-conversations/projects/CLU-Test/:train?stringIndexType=Utf16CodeUnit&api-version=2023-04-01" -SubscriptionKey "d1234c456d789"

Write-Host ApiURL: $ApiURL
Write-Host SubscriptionKey: $SubscriptionKey
Write-Host FilePath: $FilePath
$date = get-date -UFormat "%d-%m-%Y"
Write-Host Datum: $date
$modelname = "Modell-$date"
Write-Host Modell: $modelname

$body = '{ "modelLabel":"' + $modelname + '", "trainingMode":"advanced" }'
Write-Host Body: $body

$result1 = Invoke-WebRequest -Uri $ApiURL -Headers @{'Ocp-Apim-Subscription-Key' = $SubscriptionKey} -Method Post -Body $body -ContentType "application/json"