# Backup or Import some QnA- and CLU-Projects from Microsoft Language Studio and back
<p>When you create a project with Microsoft Language Studio, you inevitably need automated backups in the form of pipelines. Here you have to use the Language Studio REST API to create full-fledged backups. Here are a few helpful scripts for creating backup pipelines for the Microsoft Language Studio.</p>

## Features
<p>There are 3 different Powershell scripts intended for different applications:</p>
* Export_QnA_CLU.ps1
* Import_QnA_CLU.ps1
* Train_CLU.ps1

### Export_QnA_CLU.ps1
<p>Export a Question and Answering or Conversational Language Understanding project from Microsoft Language Studio.</p>

### Import_QnA_CLU.ps1
<p>Import a Question and Answering or Conversational Language Understanding project to Microsoft Language Studio.</p>

### Train_CLU.ps1
<p>Train a Conversational Language Understanding project in Microsoft Language Studio.</p>

## Usage
### Export_QnA_CLU.ps1

<p>Examples:</p>
<code>Export_QnA_CLU.ps1 -ApiURL "https://lanuage-rc.cognitiveservices.azure.com/language/authoring/query-knowledgebases/projects/QnA-Test/:export?stringIndexType=Utf16CodeUnit&api-version=2023-04-01&format=json" -SubscriptionKey "d1234c456d789" -FilePath "C:\Workspace\qna.json"</code>

### Import_QnA_CLU.ps1

<p>Examples:</p>
<code>Import_QnA_CLU.ps1 -ApiURL "https://lanuage-rc.cognitiveservices.azure.com/language/authoring/query-knowledgebases/projects/QnA-Test/:import?stringIndexType=Utf16CodeUnit&api-version=2023-04-01&format=json" -SubscriptionKey "d1234c456d789" -FilePath "C:\Workspace\qna.json"</code>

### Train_CLU.ps1

<p>Examples:</p>
<code>Train_CLU.ps1 -ApiURL "https://lanuage-rc.cognitiveservices.azure.com/language/authoring/analyze-conversations/projects/CLU-Test/:train?stringIndexType=Utf16CodeUnit&api-version=2023-04-01" -SubscriptionKey "d1234c456d789"</code>

