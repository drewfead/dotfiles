# todo: this
export def az_deployment_status [rg: string] {
    az deployment group list --resource-group $rg | from json | select name properties.provisioningState properties.timestamp properties.duration  | sort-by properties_timestamp | each { 
        |it| $it | update started ($it.started | into datetime) | update duration ($it.duration | into duration) 
    }
}

# az deployment group list -g rg-iusim-mortality -o json | from json | select name properties.provisioningState properties.timestamp properties.duration  | rename name status started duration | sort-by started | each { |it| $it | update started ($it.started | into datetime) | update duration ($it.duration | into duration) }