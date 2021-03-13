#!/bin/bash

valheim_server_dir="/home/steam/.config/unity3d/IronGate/Valheim/worlds"
valheim_backup_dir=$HOME"/valheim_backups/backups"

new_date=$(date +"%Y-%m-%d")
directory_name=$valheim_backup_dir/$new_date

echo "Stopping server"
systemctl stop valheimserver.service

echo "Creating new directory $directory_name"
mkdir "$directory_name"

echo "Copying current DB from ${valheim_server_dir} to $directory_name" 
cp "$valheim_server_dir/VIKING.db" "$directory_name/VIKING.db"
cp "$valheim_server_dir/VIKING.fwl" "$directory_name/VIKING.fwl"

echo "Starting server"
systemctl start valheimserver.service
systemctl is-active valheimserver.service

echo "-------------------------"
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
