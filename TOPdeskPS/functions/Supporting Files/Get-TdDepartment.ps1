﻿function Get-TdDepartment {
    <#
.SYNOPSIS
    returns list of departments
.DESCRIPTION
    returns list of departments
    .PARAMETER Name
        Filter based on the name. Wildcards accepted.

.EXAMPLE
    PS C:\> Get-TdDepartment
    returns list of departments
.EXAMPLE
    PS> Get-TdDepartment 'IT'
    Returns the IT department
#>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdDepartment')]

    param
    (
        [Parameter(Position = 0)]
        [string]
        $Name = '*'
    )

    process {
        Write-PsfMessage "ParameterSetName: $($PsCmdlet.ParameterSetName)" -level internalcomment
        Write-PSfMessage "PSBoundParameters: $($PSBoundParameters | Out-String)" -level internalcomment

        $uri = (Get-TdUrl) + "/tas/api/departments"
        $res = Invoke-TdMethod -Uri $uri
        $res
    }

}

