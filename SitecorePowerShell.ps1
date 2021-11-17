$sourceContainer = "/sitecore/AdvisoryBoard/Advisory/Home/Topics/1-To";
$destinationContainer = "/sitecore/AdvisoryBoard/Advisory/Home/Topics/2-From";

Get-ChildItem $sourceContainer | ForEach-Object {
    Move-Item -Path $_.ItemPath -Destination $destinationContainer;
}


// ------------------------------



# Move items into folders > if the folder exist move the children only > if not move folder and children > if children match don't move
$sourceContainer = "/sitecore/AdvisoryBoard/Advisory/Home/Topics/2-From";
$destinationContainer = "/sitecore/AdvisoryBoard/Advisory/Home/Topics/1-To";

function ProcessItem {
    param (
        [Sitecore.Data.Items.Item]$item
    )
    if ((Get-Item -Path ($item.Paths.FullPath -replace $sourceContainer, $destinationContainer) -ErrorAction SilentlyContinue)) {
        Get-ChildItem $item.Paths.FullPath | ForEach-Object {
            ProcessItem -item $_
        }
    }
    else {
        Move-Item -Path $item.ItemPath -Destination ($item.Parent.Paths.FullPath -replace $sourceContainer, $destinationContainer)
        write-host "item " $item.ItemPath " moved to " ($item.Parent.Paths.FullPath -replace $sourceContainer, $destinationContainer)
    }
}

Get-ChildItem $sourceContainer | ForEach-Object {
    ProcessItem -item $_ -
}


// ------------------------------


$defaultPath = "/sitecore/content"
[Sitecore.Data.ID]$articleId = "{9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}"

$articles = Find-Item -Index sitecore_master_index `
    -Where 'TemplateId = @0 and Path.StartsWith(@1)' `
    -WhereValues $articleId, $defaultPath | Initialize-Item
write-host "item " 


// ------------------------------

$path = "/sitecore/content/AdvisoryBoard/Advisory/Home/Topics/Video";
$presentTime = [datetime]::Now;
$video = "video";

write-host $presentTime; write-host $presentTime; 

$items = Get-ChildItem -Path "master:" $path -Language 'en' -recurse

write-host $items; 

foreach ($item in $items) {
    $selectedItem = Get-Item -Path "master:" -ID $item.ID
  
    #Check the items has template Id {9FB83FAB-8911-4A90-A9FD-1CD1C32AF433} 
    if ($selectedItem.TemplateId -eq "{9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}") {
        #Get the Date time value from Item
        Sitecore.Data.Fields.DateField dateTimeField = $selectedItem.Fields["End Date and Time"];

        write-host $dateTimeField.Value; 
	 
        #Validating the datetime value is expired or not
        if (dateTimeField.Value -lt $presentTime) {
            if ($null -eq $selectedItem.Fields["Content Type"]) {
                $selectedItem.Editing.BeginEdit(); 
       
                #Assigning Video value to Content Type
                $selectedItem.Fields["Content Type"].Value = $video;  
  	
                $selectedItem.Editing.EndEdit();    
            }
        }
    }
}


// Initializing required variables
$path = "/sitecore/content/AdvisoryBoard/Advisory/Home/Topics/Video";
$presentTime = [sitecore.dateutil]::ToIsoDate([dateTime]::Now)
#Here, please place your Video Item ID
$video = 'video';


//Initializing required variables
$path = "/sitecore/content/AdvisoryBoard/Advisory/Home/Topics/Video";
$presentTime = [sitecore.dateutil]::ToIsoDate([dateTime]::Now)
#Here, please place your Video Item ID
$video = '{998EE684-523B-4E2A-B8E1-8E4F6CDB18C3}';

write-host $presentTime;

$items = Get-ChildItem -Path master:$path -Language 'en' -recurse

foreach ($item in $items) {
    $selectedItem = Get-Item -Path "master:" -ID $item.ID
    write-host $selectedItem; 

    #Check the items has template Id {9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}
    if ($selectedItem.TemplateId -eq "{9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}") {
        #Get the Date time value from Item
        $sitecoreTime = $selectedItem.'End Date and Time';

        $sitecoreTimeCon = [sitecore.dateutil]::ToIsoDate($sitecoreTime)

        write-host $sitecoreTimeCon; 

        #Validating the datetime value is expired or not
        if ($sitecoreTimeCon -lt $presentTime) {
            if ($null -eq $selectedItem.'Content Type') {
                $selectedItem.Editing.BeginEdit();

                #Assigning Video value to Content Type
                $selectedItem.'Content Type' = $video;

                $selectedItem.Editing.EndEdit();
            }
        }
    }
}



//Initializing required variables
$path = "/sitecore/content/AdvisoryBoard/Advisory/Home/Topics/Video";
$presentTime = [sitecore.dateutil]::ToIsoDate([dateTime]::Now)
#Here, please place your Video Item ID
$video = '{998EE684-523B-4E2A-B8E1-8E4F6CDB18C3}';

$items = Get-ChildItem -Path master:$path -Language 'en' -recurse
foreach ($item in $items) {
    $selectedItem = Get-Item -Path "master:" -ID $item.ID

    #Check the items has template Id {9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}

    if ($selectedItem.TemplateId -eq "{9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}") {
        #Get the Date time value from Item
        $sitecoreTime = $selectedItem.'End Date and Time';

        $sitecoreTimeCon = [sitecore.dateutil]::ToIsoDate($sitecoreTime)

        #Validating the datetime value is expired or not
        if ($sitecoreTimeCon -lt $presentTime) {
            Write-Host 'Checked the item by time'
            if ($selectedItem.'Content Type' -eq $null) {

                Write-Host $selectedItem.ItemPath 'item content type is null'
                $selectedItem.Editing.BeginEdit();

                #Assigning Video value to Content Type

                $selectedItem.'Content Type' = $video;

                $selectedItem.Editing.EndEdit();

            }

        }
    }

}


$path = "/sitecore/A/B/Home/Topics/2-From";
$presentTime = [sitecore.dateutil]::ToIsoDate([dateTime]::Now)
#Here, please place your Video Item ID
$video = '{A83DA840-3032-46FE-A8C3-647239161897}';

$items = Get-ChildItem -Path master:$path -Language 'en' -recurse
foreach ($item in $items) {
    $selectedItem = Get-Item -Path "master:" -ID $item.ID

    #Check the items has template Id {9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}

    if ($selectedItem.TemplateId -eq "{9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}") {
        #Get the Date time value from Item
        $sitecoreTime = $selectedItem.'End Date and Time';

        $sitecoreTimeCon = [sitecore.dateutil]::ToIsoDate($sitecoreTime)

        #Validating the datetime value is expired or not
        if ($sitecoreTimeCon -lt $presentTime) {
            Write-Host 'Checked the item by time'
            if ($selectedItem.'Content Type' -notMatch '{998EE684-523B-4E2A-B8E1-8E4F6CDB18C3}') {

                Write-Host $selectedItem.ItemPath 'item content type doesnt have Video'
                $selectedItem.Editing.BeginEdit();

                #Assigning Video value to Content Type

                $selectedItem.'Content Type' = $video;

                $selectedItem.Editing.EndEdit();

            }

        }
    }

}



//Initializing required variables
$path = "/sitecore/content/AdvisoryBoard/Advisory/Home/Topics/Video";
$presentTime = [sitecore.dateutil]::ToIsoDate([dateTime]::Now)
#Here, please place your Video Item ID
$video = '{998EE684-523B-4E2A-B8E1-8E4F6CDB18C3}';

$items = Get-ChildItem -Path master:$path -Language 'en' -recurse
foreach ($item in $items) {
    $selectedItem = Get-Item -Path "master:" -ID $item.ID

    #Check the items has template Id {9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}

    if ($selectedItem.TemplateId -eq "{9FB83FAB-8911-4A90-A9FD-1CD1C32AF433}") {
        #Get the Date time value from Item
        $sitecoreTime = $selectedItem.'End Date and Time';

        $sitecoreTimeCon = [sitecore.dateutil]::ToIsoDate($sitecoreTime)

        #Validating the datetime value is expired or not
        if ($sitecoreTimeCon -lt $presentTime) {
            Write-Host 'Checked the item by time'
            if ($selectedItem.'Content Type' -notMatch '{998EE684-523B-4E2A-B8E1-8E4F6CDB18C3}') {

                Write-Host $selectedItem.ItemPath 'item content type doesnt have Video'
                $selectedItem.Editing.BeginEdit();

                #Assigning Video value to Content Type

                $selectedItem.'Content Type' += "|";

                $selectedItem.'Content Type' += $video;

                $selectedItem.Editing.EndEdit();
            }
        }
    }
}