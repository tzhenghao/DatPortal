#!/bin/bash

# Name: Zheng Hao Tan
# Email: tanzhao@umich.edu

LOCAL_USERNAME=<your local home path>
REMOTE_SERVER_USERNAME=<your remote server username>
REMOTE_SERVER_IP_ADDRESS=<your ip address here>

# Local home directories, where these files/folders will be synced to the server.
LOCAL_DROPBOX_PATH=/Users/$LOCAL_USERNAME/Dropbox
LOCAL_GOOGLE_DRIVE_PATH="/Users/$LOCAL_USERNAME/Google Drive"
LOCAL_BOX_SYNC_PATH="/Users/$LOCAL_USERNAME/Box Sync"
LOCAL_DESKTOP_PATH=/Users/$LOCAL_USERNAME/Desktop

# Remote folders in which synced files will be located.
# You may change it to whichever path you like.
REMOTE_DROPBOX_PATH=/home/dropbox-backup
REMOTE_GOOGLE_DRIVE_PATH=/home/google-drive-backup
REMOTE_BOX_SYNC_PATH=/home/box-backup
REMOTE_DESKTOP_PATH=/home/desktop-backup

echo "Starting to back up Dropbox files"
rsync -azP $LOCAL_DROPBOX_PATH "$REMOTE_SERVER_USERNAME@$REMOTE_SERVER_IP_ADDRESS:$REMOTE_DROPBOX_PATH"
echo "Done backing up Dropbox files"

echo "Starting to back up Google Drive files"
rsync -azP "$LOCAL_GOOGLE_DRIVE_PATH" "$REMOTE_SERVER_USERNAME@$REMOTE_SERVER_IP_ADDRESS:$REMOTE_GOOGLE_DRIVE_PATH"
echo "Done backing up Google Drive files"

echo "Starting to back up Box files"
rsync -azP "$LOCAL_BOX_SYNC_PATH" "$REMOTE_SERVER_USERNAME@$REMOTE_SERVER_IP_ADDRESS:$REMOTE_BOX_SYNC_PATH"
echo "Done backing up Box files"

echo "Starting to back up Desktop files"
rsync -azP $LOCAL_DESKTOP_PATH "$REMOTE_SERVER_USERNAME@$REMOTE_SERVER_IP_ADDRESS:$REMOTE_DESKTOP_PATH"
echo "Done backing up Desktop files"
