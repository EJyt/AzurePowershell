Install-Module Microsoft.Graph -Scope AllUsers
Import-Module Microsoft.Graph.Users
Connect-MgGraph -Scopes "User.ReadWrite.All" -UseDeviceCode
$userList = Import-Csv -Path "Path\to\csv\file.csv" -Delimiter ";"

foreach ($user in $userList) {

    try {
        # Use the Remove-MgUser cmdlet to remove the user
        Remove-MgUser -UserId $user.ObjectId 
        Write-Host "User with ID " $user.Userprincipalname "removed successfully."
    }
    catch {
        Write-Host "Failed to remove user with ID $user $_"
    }
}