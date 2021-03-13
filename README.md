# Creating Automated Daily Backups of Valheim Server
This repository contains some helpful bash scripts for:
 * Creating a service to stop the server, copy the world files to a different directory, and restart the server
 * Start a simple HTTP server to allow users to download a given backup at any point in time
 * Send the data to an [Airtable](https://airtable.com) base to create an offsite backup

```
I know little about server administration.  
So take everything in this for what it's worth.
There may be more secure or more effective ways to accomplish this.
```


