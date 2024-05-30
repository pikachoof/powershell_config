function Check-Choices {
	param (
		[string]$choice,
		[array]$list
	)

	[bool]$result = $true
	
	foreach ($item in $choices) {
		if ($item -eq $choice) {
			$result = $false
			break
		}
	}

	return $result
}

function Execute-Choice {
	param ([string]$choice)
	
	Write-Host "Outputting $choice"
}
	

function Show-Menu {
	param ([array]$menu)

	foreach ($menuitem in $menu) {
		Write-Host "$menuitem"
	}
}

[array]$choices = @("One", "Two", "Three", "Exit")

do {
	Show-Menu
	[string]$choice = Read-Host "Select an option"
	$choice = $choice.ToString()
	[bool]$result = Check-Choices -choice $choice -choices $choices
	if ($result -eq $true) {
		Write-Host "Choice present in choices, executing..."
		Execute-Choice -choice $choice
	} else {
		Write-Host "Choice not present in choices"
	}
} while ($choice -ne "Exit")
