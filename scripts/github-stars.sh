#! /bin/bash

#
# Script to get stars from our repositories for our KPI Dashboard
#
# You can get your token at https://github.com/settings/tokens
# Configure a global variable named GITHUB_USERNAME with your GitHub username
# Configure a global variable named GITHUB_STARS_TOKEN with the token you just created
#

org="mindee"
repos=(
    "demo-Nodejs-SDK"
    "demo-plates-DVLA"
    "devrel"
    "doctr"
    "integration-zapier"
    "integration-microsoft-flow"
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
    stars=$(curl --silent -u $GITHUB_USERNAME:$GITHUB_STARS_TOKEN  "$api_url$org/$repo"  | jq '.stargazers_count')
    printf "%s\n" "${bold}$repo:${normal} $stars"

    excel="$excel$stars,"
done

printf "\n\n%s\n" "-------------"
echo "| Excel CSV |"
printf "%s\n" "-------------"
echo "$excel"
