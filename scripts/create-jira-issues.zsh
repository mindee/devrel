#!/bin/zsh

PAGE=$1
URL=$2

curl -X POST https://mindee-devrel.atlassian.net/rest/api/3/issue -H 'Authorization: Basic '$JIRA_API_KEY -H 'Accept: application/json' -H 'Content-Type: application/json' --data '
{
    "fields": {
        "summary": "Review the “'$PAGE'” documentation page",
        "issuetype": {
			"id": "10001"
		},
        "project": {
			"key": "DEVREL"
		},
        "description": {
			"type": "doc",
        	"version": 1,
            "content": [
                {
                    "type": "paragraph",
                    "content": [
						{
							"type": "text",
							"text": "Review the "
						},
						{
							"type": "text",
							"text": "'$PAGE'",
							"marks": [
								{
									"type": "link",
									"attrs": {
										"href": "'$URL'"
									}
								}
							]
						},
						{
							"type": "text",
							"text": " documentation page"
						}
                    ]
                }
            ]
        },
        "reporter": {
			"accountId": "61f17bab78b7fd0072ec4914"
		},
        "assignee": {
			"accountId": "623c37d27910a200718bac4a"
		},
        "labels": [
			"documentation",
			"API-Builder",
			"2022-Q2"
		]
    }
}
'