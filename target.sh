#!/bin/bash

# Create a new Google Cloud project
gcloud projects create avenue_z-target --name="Avenue_Z-Target"

# Set the current Google Cloud project
gcloud config set project avenue_z-target

# Create a new service account
gcloud iam service-accounts create Avenue_Z-Target --project=avenue_z-target

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding avenue_z-target --member="serviceAccount:Avenue_Z-Target@avenue_z-target.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Avenue_Z-Target@avenue_z-target.iam.gserviceaccount.com --project=avenue_z-target --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Avenue_Z-Target.json --iam-account=Avenue_Z-Target@avenue_z-target.iam.gserviceaccount.com --project=avenue_z-target

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=avenue_z-target

# Download the service account key JSON file
cloudshell download Avenue_Z-Target.json
