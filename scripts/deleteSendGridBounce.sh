#!/bin/zsh

apiKey="ADD_YOUR_SENDGRID_API_KEY_HERE"
listId="ADD_THE_CONTACT_LIST_ID_FROM_SENDGRID"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Get emails from the SendGrid Suppression Bounced CSV export
emailList=("${(@f)$(mlr --c2j --jlistwrap cat suppression_bounces.csv | jq '.[] | .email' | sed 's/\"//g')}")
#printf '%s\n' "${emailList[@]}"

# Get the contact id
for email in $emailList; do
	contactId=$(curl --silent -X "POST" "https://api.sendgrid.com/v3/marketing/contacts/search" -H "Authorization: Bearer $apiKey" --header "content-type: application/json" --data '{"query": "email LIKE '"'$email'"' AND CONTAINS(list_ids, '"'$listId'"')"}' | jq -c '.result[0] | .id' | sed 's/\"//g')

	# Delete the contact id if it exist
	if [ "$contactId" != "null" ]; then
		# Maybe add verification it's deleted
		curl --silent -X "DELETE" "https://api.sendgrid.com/v3/marketing/lists/$listId/contacts?contact_ids=$contactId" -H "Authorization: Bearer $apiKey" >/dev/null
		echo "${GREEN}The email $email has been removed from your list"
	else
		echo "${RED}The email $email does not exist in your list"
	fi
done


