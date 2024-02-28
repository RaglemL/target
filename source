#!/bin/bash

# Create a new Google Cloud project
gcloud projects create name-target --name="Name-Target"

# Set the current Google Cloud project
gcloud config set project name-target

# Create a new service account
gcloud iam service-accounts create Name-Target --project=name-target

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding name-target --member="serviceAccount:Name-Target@name-target.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Name-Target@name-target.iam.gserviceaccount.com --project=name-target --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Name-Target.json --iam-account=Name-Target@name-target.iam.gserviceaccount.com --project=name-target

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=name-target

# Download the service account key JSON file
cloudshell download Name-Target.json
