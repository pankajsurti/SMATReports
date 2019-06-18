function Create-MigrationTrackerList
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true)]
        [Alias('Url')]
        [string]$SiteUrl='',
        [Parameter(Mandatory=$true)]
        [Alias('ListName')]
        [string]$MigrationTrackerListName='MigrationTrackerList'
    )
    Begin
    {
    }
    Process
    {
        #Create the list
        $listTitle = $MigrationTrackerListName 
        New-PnPList -Title $MigrationTrackerListName -Url $MigrationTrackerListName -Template GenericList 
        
		#Create the fields
        Add-PnPField -DisplayName 'Farm' -InternalName 'Farm' -Type Text -List $listTitle -AddToDefaultView
        Add-PnPField -DisplayName 'SiteId' -InternalName 'SiteId' -Type Guid -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'SiteUrl' -InternalName 'SiteUrl' -Type URL -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'SiteOwner' -InternalName 'SiteOwner' -Type Text -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'SiteAdmins' -InternalName 'SiteAdmins' -Type Note -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'ContentDBName' -InternalName 'ContentDBName' -Type Text -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'ContentDBServerName' -InternalName 'ContentDBServerName' -Type Text -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'NumOfWebs' -InternalName 'NumOfWebs' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'SiteSizeInMB' -InternalName 'SiteSizeInMB' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'ContentDBSizeInMB' -InternalName 'ContentDBSizeInMB' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'TotalIssues' -InternalName 'TotalIssues' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'Alerts' -InternalName 'Alerts' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'Apps' -InternalName 'Apps' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'BCSApplications' -InternalName 'BCSApplications' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'BrowserFileHandling' -InternalName 'BrowserFileHandling' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'CheckedOutFiles' -InternalName 'CheckedOutFiles' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'CustomizedPages' -InternalName 'CustomizedPages' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'CustomProfilePropertyMappings' -InternalName 'CustomProfilePropertyMappings' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'EmailEnabledLists' -InternalName 'EmailEnabledLists' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'FileVersions' -InternalName 'FileVersions' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'FullTrustSolution' -InternalName 'FullTrustSolution' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'InfoPath' -InternalName 'InfoPath' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'IRMEnabledLibrary' -InternalName 'IRMEnabledLibrary' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'LargeExcelFiles' -InternalName 'LargeExcelFiles' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'LargeLists' -InternalName 'LargeLists' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'LargeListViews' -InternalName 'LargeListViews' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'LargeSites' -InternalName 'LargeSites' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'LockedSites' -InternalName 'LockedSites' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'LongODBUrl' -InternalName 'LongODBUrl' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'NonDefaultMasterPages' -InternalName 'NonDefaultMasterPages' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'SandboxSolution' -InternalName 'SandboxSolution' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'SecureStoreApplications' -InternalName 'SecureStoreApplications' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'UnsupportedWebTemplate' -InternalName 'UnsupportedWebTemplate' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'WebApplicationPolicy' -InternalName 'WebApplicationPolicy' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'WorkflowAssociations2010' -InternalName 'WorkflowAssociations2010' -Type Integer -List $listTitle  -AddToDefaultView
        Add-PnPField -DisplayName 'WorkflowAssociations2013' -InternalName 'WorkflowAssociations2013' -Type Integer -List $listTitle  -AddToDefaultView

    }
    End
    {
    }
}


$scaUPN="admin@M365x671508.onmicrosoft.com" # change the user name
$tenant = "M365x671508"; # TODO provide your tenant name
$sourceSite = "/sites/spomigrations"; # Change the site name if it is not the same
$webUrl = "https://{0}.sharepoint.com{1}/" -f $tenant, $sourceSite;
$userCredential = Get-Credential -UserName $scaUPN -Message "Enter Password for DVAGOV"
# Get context
$webUrl = "https://{0}.sharepoint.com{1}/" -f $tenant, $sourceSite;
Write-Output $("Connecting to {0}" -f $webUrl);
$conn = Connect-PnPOnline -Url $webUrl -Credentials $userCredential -ReturnConnection 
Create-MigrationTrackerList -SiteUrl $webUrl -MigrationTrackerListName "MigrationTracker"
