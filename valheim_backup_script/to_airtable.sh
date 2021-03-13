new_date=$(date +"%Y-%m-%d")

echo "Uploading files to Airtable"
curl --location --request POST 'https://api.airtable.com/v0/appUgqqarki4eaOZn/tblSNQwZ1xHBX7pjT' \
       	--header "Authorization: Bearer $AIRTABLE_API_KEY"\
        --header 'Content-Type: application/json' \
        --data-binary @- <<DATA
{
    "fields": {
        "Attachments": [
            {
                "url": "http://valheim.thef1rstpancake.com:8000/${new_date}/VIKING.db"
            },
            {
                "url": "http://valheim.thef1rstpancake.com:8000/${new_date}/VIKING.fwl"
            }
        ]
    }
}
DATA
echo "\n"
echo "-------------------------"
echo "Done!"
