Add-Type -AssemblyName PresentationFramework

# Create XAML for the menu
$menuXAML = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Menu" Height="200" Width="300">
    <Grid>
        <StackPanel HorizontalAlignment="Center" VerticalAlignment="Center">
            <Button Name="Option1Button" Content="Option 1" Width="100" Margin="5"/>
            <Button Name="Option2Button" Content="Option 2" Width="100" Margin="5"/>
            <Button Name="Option3Button" Content="Option 3" Width="100" Margin="5"/>
            <Button Name="QuitButton" Content="Quit" Width="100" Margin="5"/>
        </StackPanel>
    </Grid>
</Window>
"@

# Load the XAML
$menuWindow = [Windows.Markup.XamlReader]::Load((New-Object System.IO.StringReader $menuXAML))

# Define event handlers
$Option1Button.Add_Click({
    Write-Host "You chose Option 1"
    # Add your code for Option 1 here
})

$Option2Button.Add_Click({
    Write-Host "You chose Option 2"
    # Add your code for Option 2 here
})

$Option3Button.Add_Click({
    Write-Host "You chose Option 3"
    # Add your code for Option 3 here
})

$QuitButton.Add_Click({
    $menuWindow.Close()
})

# Show the menu
$menuWindow.ShowDialog() | Out-Null
