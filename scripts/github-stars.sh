#! /bin/bash

#
# Script to get stars from our repositories for our KPI Dashboard
#
# You can get your token at https://github.com/settings/tokens
#

username=""
token=""
org="mindee"
repos=(
    "devrel"
    "doctr"
    "microsoft-flow-invoice-integration"
    "mindee-api-python"
    "mindee-js"
    "notebooks"
    "react-mindee-js"
    "mindee-api-nodejs"
    "tf-builds"
    "vue-mindee-js"
)

###################################
# Do not modify beyong this point #
###################################

api_url="https://api.github.com/repos/"
bold=$(tput bold)
normal=$(tput sgr0)

printf "\n%s\n" "----------------------"
echo "| Repositories Stars |"
printf "%s\n" "----------------------"

# looping the repos
for repo in "${repos[@]}"
do
    stars=$(curl --silent -u $username:$token  "$api_url$org/$repo"  | jq '.stargazers_count')
    printf "%s\n" "${bold}$repo:${normal} $stars"

    excel="$excel$stars,"
done

printf "\n\n%s\n" "-------------"
echo "| Excel CSV |"
printf "%s\n" "-------------"
echo "$excel"
