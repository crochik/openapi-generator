# $ConfigFile = "./typescript-fetch.json"
# $Config = Get-Content -Raw -Path ${ConfigFile} | ConvertFrom-Json

# # increment version on config file
# $Version = $Config.npmVersion.Split(".")
# $NewVersion = $Version[0] + "." + $Version[1] + "." + ([int]$Version[2] + 1)
# Write-Output "New Version: ${NewVersion}"
# $Config.npmVersion = $NewVersion
# $Config | ConvertTo-Json | Out-File ${ConfigFile}

Remove-Item -Recurse -Path ./out/dart -Force 
mkdir -p out/dart

./run-in-docker.sh generate -i sample.json -o /gen/out/dart -g dart-dio  --global-property debugModels=true --skip-validate-spec -t template -c dart.json
# 
# ./run-in-docker.sh generate -i sample.json -o /gen/out/typescript -g typescript-fetch --global-property debugModels=true --skip-validate-spec -t template-ts 