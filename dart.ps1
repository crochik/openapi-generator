# $ConfigFile = "./typescript-fetch.json"
# $Config = Get-Content -Raw -Path ${ConfigFile} | ConvertFrom-Json

# # increment version on config file
# $Version = $Config.npmVersion.Split(".")
# $NewVersion = $Version[0] + "." + $Version[1] + "." + ([int]$Version[2] + 1)
# Write-Output "New Version: ${NewVersion}"
# $Config.npmVersion = $NewVersion
# $Config | ConvertTo-Json | Out-File ${ConfigFile}

# Remove-Item -Recurse -Path ./dart -Force 
# mkdir -p dart

# docker run --rm -it -w /src -v "${PWD}:/gen" openapitools/openapi-generator-cli:v7.3.0 generate -i /gen/swagger.json -o /gen -g typescript-fetch -c /gen/typescript-fetch.json --skip-validate-spec
./run-in-docker.sh generate -i swagger.json -o ./build/dart -g dart-dio -c dart.json --skip-validate-spec -t template/dart-dio 

# cd dart
# dart pub get 
# dart run build_runner build 