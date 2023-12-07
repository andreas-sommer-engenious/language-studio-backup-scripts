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
#.\Import_QnA_CLU.ps1 -ApiURL "https://lanuage-rc.cognitiveservices.azure.com/language/authoring/query-knowledgebases/projects/QnA-Test/:import?stringIndexType=Utf16CodeUnit&api-version=2023-04-01&format=json" -SubscriptionKey "d1234c456d789" -FilePath "C:\Workspace\qna.json"

Write-Host ApiURL: $ApiURL
Write-Host SubscriptionKey: $SubscriptionKey
Write-Host FilePath: $FilePath
$body = (Get-Content -Raw -Encoding UTF8 -Path $FilePath)
$body2 = $body | ConvertTo-Json

Write-Host Start Read Body2: "---------------------------------------------------------------------------------"
Write-Host $body2
Write-Host End Read Body2: "---------------------------------------------------------------------------------"

$result1 = Invoke-RestMethod -Uri $ApiURL -Headers @{'Ocp-Apim-Subscription-Key' = $SubscriptionKey} -Method Post -InFile $FilePath -ContentType "application/json"