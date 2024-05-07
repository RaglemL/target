#!/bin/bash

# Create a new Google Cloud project
gcloud projects create avenue z-target --name="Avenue Z-Target"

# Set the current Google Cloud project
gcloud config set project avenue z-target

# Create a new service account
gcloud iam service-accounts create Avenue Z-Target --project=avenue z-target

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding avenue z-target --member="serviceAccount:Avenue Z-Target@avenue z-target.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Avenue Z-Target@avenue z-target.iam.gserviceaccount.com --project=avenue z-target --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Avenue Z-Target.json --iam-account=Avenue Z-Target@avenue z-target.iam.gserviceaccount.com --project=avenue z-target

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=avenue z-target

# Download the service account key JSON file
cloudshell download Avenue Z-Target.json
