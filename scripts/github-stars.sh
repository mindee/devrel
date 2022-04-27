#!/bin/zsh

#
# Script to get stars from our repositories for our KPI Dashboard
#
# You can get your token at https://github.com/settings/tokens with scopes "repo > public_replo" only if you are getting the stars only for public repositories. Give full "repo" scope for public & private ones.
#
# Configure a global variable named GITHUB_USERNAME with your GitHub username
# Configure a global variable named GITHUB_STARS_TOKEN with the token you just created
#

org="mindee"
repos=(
    "demo-Nodejs-SDK"
    "demo-plates-DVLA"
    "demo-Python-SDK"
    "devrel"
    "doctr"
    "doctr-tfjs-demo"
    "integration-microsoft-flow"
    "integration-zapier"
    "mindee-api-java"
    "mindee-api-nodejs"
    "mindee-api-python"
    "mindee-api-ruby"
    "notebooks"
    "Problem-of-BatchNorm"
    "react-mindee-js"
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
total_stars=0
for repo in "${repos[@]}"
do
    stars=$(curl --silent -u $GITHUB_USERNAME:$GITHUB_STARS_TOKEN  "$api_url$org/$repo"  | jq '.stargazers_count')
    printf "%s\n" "${bold}$repo:${normal} $stars"

    excel="$excel$stars,"

    total_stars=$(($total_stars+$stars))
done

printf "\n\n%s\n" $total_stars

printf "\n\n%s\n" "-------------"
echo "| Excel CSV |"
printf "%s\n" "-------------"
echo "$excel"
