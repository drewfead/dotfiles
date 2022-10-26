# def "nu-complete az command group" [] {
    
# }

# export extern "az" [
#     command-group: string@"nu-complete az command group"
# ]

def "nu-complete az output-formats" [] {
    ["json", "jsonc", "none", "table", "tsv", "yaml", "yamlc"]
}

# Log in to Azure.
export extern "az login" [
    --allow-no-subscriptions # Support access tenants without subscriptions. It's uncommon but useful to run tenant level commands, such as 'az ad'.
    --federated-token: string # Federated token that can be used for OIDC token exchange.
    --password(-p): string # Credentials like user password, or for a service principal, provide client secret or a pem file with key and public certificate. Will prompt if not given.
    --scope: string # Used in the /authorize request. It can cover only one static resource.
    --service-principal: string # The credential representing a service principal.
    --tenant(-t): string # The AAD tenant, must provide when using service principals.
    --use-cert-sn-issuer # Used with a service principal configured with Subject Name and Issuer Authentication in order to support automatic certificate rolls.
    --use-device-code # Use CLI's old authentication flow based on device code. CLI will also use this if it can't launch a browser in your behalf, e.g. in remote SSH or Cloud Shell.
    --username(-u): string # User name, service principal, or managed service identity ID.
    --identity(-i) # Log in using the Virtual Machine's identity.
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]

# Get a list of subscriptions for the logged in account. By default, only 'Enabled' subscriptions from the current cloud are shown.
export extern "az account list" [
    --all # List all subscriptions from all clouds, rather than just 'Enabled' ones.
    --refresh # Retrieve up-to-date subscriptions from server.
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]

def "nu-complete az subscriptions" [] {
    az account list -o json | from json | get name
}

# Set a subscription to be the current active subscription.
export extern "az account set" [
    --name(-n): string@"nu-complete az subscriptions" # Name or ID of subscription. Same as `--subscription`.
    --subscription(-s): string@"nu-complete az subscriptions" # Name or ID of subscription. Same as `--name`.
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.    
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]

# List supported regions for the current subscription.
export extern "az account list-locations" [
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.    
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]

def "nu-complete az locations" [] {
    az account list-locations -o tsv | lines | split column "\t" | get column4
}

# Create a new resource group.
export extern "az group create" [
    --location(-l): string@"nu-complete az locations" # Location. You can configure the default location using `az configure --defaults location=<location>`.
    --name(-n): string # Name of the new resource group. Same as `--resource-group`.
    --resource-group(-g): string # Name of the new resource group. Same as `--name`.
    --managed-by: string # The ID of the resource that manages this resource group.
    --tags: string # Space-separated tags: key[=value] [key[=value] ...]. Use '' to clear existing tags.
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.    
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --subscription: string@"nu-complete az subscriptions" # Name or ID of subscription. You can configure the default subscription using `az account set -s NAME_OR_ID`.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]

# List resource groups.
export extern "az group list" [
    --tag: string # A single tag in 'key[=value]' format. Use "" to clear existing tags.
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.    
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --subscription: string@"nu-complete az subscriptions" # Name or ID of subscription. You can configure the default subscription using `az account set -s NAME_OR_ID`.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]

# Delete resource group.
export extern "az group delete" [
    --name(-n): string # Name of resource group. You can configure the default group using `az configure --defaults group=<name>`. Same as `--resource-group`.
    --resource-group(-g): string # Name of resource group. You can configure the default group using `az configure --defaults group=<name>`. Same as `--name`.
    --force-deletion-types(-f): string # The resource types you want to force delete.  Allowed values: Microsoft.Compute/virtualMachineScaleSets,Microsoft.Compute/virtualMachines.
    --no-wait # Do not wait for the long-running operation to finish.
    --yes(-y) # Do not prompt for confirmation.
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.    
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --subscription: string@"nu-complete az subscriptions" # Name or ID of subscription. You can configure the default subscription using `az account set -s NAME_OR_ID`.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]

def "nu-complete az deployment modes" [] {
    ["Complete", "Incremental"]
}

def "nu-complete az change type" [] {
    ["Create", "Delete", "Deploy", "Ignore", "Modify", "NoChange", "Unsupported"]
}

def "nu-complete az result format" [] {
    ["FullResourcePayloads", "ResourceIdOnly"]
}

# Start a deployment at resource group.
export extern "az deployment group create" [
    --resource-group(-g): string # The resource group to create deployment at. Required.
    --aux-tenants: string # Auxiliary subscriptions which will be used during deployment across tenants.
    --confirm-with-what-if(-c) # Instruct the command to run deployment What-If before executing the deployment. It then prompts you to acknowledge resource changes before it continues
    --mode: string@"nu-complete az deployment modes" # The deployment mode.  Allowed values: Complete, Incremental.  Default: Incremental.
    --name: string # The deployment name.
    --no-prompt: bool # The option to disable the prompt of missing parameters for ARM template. When the value is true, the prompt requiring users to provide missing parameter will be ignored. The default value is false.  Allowed values: false, true.
    --no-wait # Do not wait for the long-running operation to finish.
    --parameters(-p): path # Supply deployment parameter values. Parameters may be supplied from a file using the `@{path}` syntax, a JSON string, or as <KEY=VALUE> pairs. Parameters are evaluated in order, so when a value is assigned twice, the latter value will be used. It is recommended that you supply your parameters file first, and then override selectively using KEY=VALUE syntax.
    --proceed-if-no-change # Instruct the command to execute the deployment if the What-If result contains no resource changes. Applicable when `--confirm-with-what-if` is set.
    --query-string(-q): string # The query string (a SAS token) to be used with the template-uri in the case of linked templates.
    --rollback-on-error # The name of a deployment to roll back to on error, or use as a flag to roll back to the last successful deployment.
    --template-file(-f): path # The path to the template file or Bicep file.
    --template-spec(-s): string # The template spec resource id.
    --template-uri(-u): string # The URI to the template file.
    --what-f(-w) # Instruct the command to run deployment What-If.
    --what-if-exclude-change-types(-x): string@"nu-complete az change type" # Space-separated list of resource change types to be excluded from What-If results. Applicable when `--confirm-with-what-if` is set.  Allowed values: Create, Delete, Deploy, Ignore, Modify, NoChange, Unsupported.
    --what-if-result-format(-r): string@"nu-complete az result format" # The format of What-If results. Applicable when `--confirm-with-what-if` is set. Allowed values: FullResourcePayloads, ResourceIdOnly. Default: FullResourcePayloads.
    --debug # Increase logging verbosity to show all debug logs.
    --only-show-errors # Only show errors, suppressing warnings.
    --output(-o): string@"nu-complete az output-formats" # Output format.  Allowed values: json, jsonc, none, table, tsv, yaml, yamlc.  Default: table.    
    --query: string # JMESPath query string. See http://jmespath.org/ for more information and examples.
    --subscription: string@"nu-complete az subscriptions" # Name or ID of subscription. You can configure the default subscription using `az account set -s NAME_OR_ID`.
    --verbose # Increase logging verbosity. Use --debug for full debug logs.
]