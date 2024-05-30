function List-Choices {
	param ([array]$choices)

	for ($i = 0; $i -lt $choices.Length; $i++) {
		Write-Host "$i | $($choices[$i])"
	}
}

function Check-Choice {
	param (
		[int]$idx,
		[array]$choices
	)

	return ($idx -ge 0 -and $idx -lt $choices.Length)
}

function Execute-Choice {
	param (
		[int]$index,
		[array]$cmds
	)

	Write-Host "Executing function $($cmds[$idx]) at index [$index]"
	try {
		& $cmds[$idx]
	} catch {
		Write-Error "FUNCTION NOT EXECUTABLE, TRY ANOTHER ONE!"
	}
}

[array]$cmds = @()
[int]$idx = -1

do {
	$cmds = Get-History
	List-Choices -choices $cmds
	$idx = Read-Host "Input choice (-1 to exit)"
	Write-Host ""
	if ($idx -eq -1) { break } 
	$result = Check-Choice -idx $idx -choices $cmds
	if ($result -eq $true) {
		Write-Host "Choice present in get-history. executing..."
		Execute-Choice -index $idx -cmds $cmds
	} else {
		$idx = -2
		Write-Host "Choice not present in get-history. Try again!"
	}
} while ($idx -ne -1)
Write-Host "Exiting."
