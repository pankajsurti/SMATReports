# This script will import the SiteAsessment.CSV file
# to the Migration Tracker list
$tenant = "M365x671508"; # TODO provide your tenant name
$sourceSite = "/sites/spomigrations"; # Change the site name if it is not the same
$scaUPN="admin@M365x671508.onmicrosoft.com" # change the user name

#TO DO define clear text password in other windows.
#$pass=$openPassword|ConvertTo-SecureString -AsPlainText -Force
# $userCredential = New-Object   System.Management.Automation.PsCredential($scaUPN,$pass)

$userCredential = Get-Credential -UserName $scaUPN -Message "Enter Password for DVAGOV"

# Get context
$webUrl = "https://{0}.sharepoint.com{1}/" -f $tenant, $sourceSite;
Write-Output $("Connecting to {0}" -f $webUrl);
$conn = Connect-PnPOnline -Url $webUrl -Credentials $userCredential -ReturnConnection 

# TODO make sute the SiteAsessment.CSV file is presnet in the 
$currentFarm2Import = 'SiteAsessment'
$listName = 'MigrationTracker'
$siteSummaries = import-csv .\$currentFarm2Import.csv

ForEach ($siteSummary in $siteSummaries){
    $item = Add-PnPListItem -List $listName -Connection $con

    Set-PnPListItem -Identity $item -List $listName -Values `
        @{ "ContentDBName"=$siteSummary.ContentDBName; `
           "ContentDBServerName"=$siteSummary.ContentDBServerName; `
           "ContentDBSizeInMB"=$siteSummary.ContentDBSizeInMB; `
           "Farm"=$currentFarm2Import; `
           "NumOfWebs"=$siteSummary.NumOfWebs; `
           "SiteAdmins"=$siteSummary.SiteAdmins; `
           "SiteOwner"=$siteSummary.SiteOwner; `
           "SiteSizeInMB"=$siteSummary.SiteSizeInMB; `
           "SiteUrl"=$siteSummary.SiteUrl; `
           "TotalIssues"=$siteSummary.TotalIssues; `
         }

    Write-host $currentFarm2Import $siteSummary.SiteUrl
}
# The following fields are populated 
#ContentDBName       
#ContentDBServerName 
#ContentDBSizeInMB   
#Farm                
#NumOfWebs           
#SiteAdmins          
#SiteOwner           
#SiteSizeInMB        
#SiteUrl             
#TotalIssues         

