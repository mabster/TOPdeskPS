﻿function Get-TdProcessingStatus {
    <#
    .SYNOPSIS
        Gets processing statuses
    .DESCRIPTION
        Gets processing statuses
    .PARAMETER Name
        Name of the processing status that you want returned. Wildcards are supported. Default value is '*'
    .EXAMPLE
        PS C:\> Get-TdProcessingStatus
        Gets list of all processing statuses

    #>
    [CmdletBinding(HelpUri = 'https://andrewpla.github.io/TOPdeskPS/commands/Get-TdProcessingStatus')]
    param (
        [string]$Name = '*'
    )
    $uri = (Get-TdUrl) + '/tas/api/incidents/processing_status'
    $Params = @{
        'uri' = $uri
    }
    $res = Invoke-TdMethod @Params
    $res | Where-Object name -like $Name
}
