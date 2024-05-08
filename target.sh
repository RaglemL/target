#!/bin/bash

# Create a new Google Cloud project
gcloud projects create locomotive-agency-target --name="Locomotive-Agency-Target"

# Set the current Google Cloud project
gcloud config set project locomotive-agency-target

# Create a new service account
gcloud iam service-accounts create Locomotive-Agency-Target --project=locomotive-agency-target

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding locomotive-agency-target --member="serviceAccount:Locomotive-Agency-Target@locomotive-agency-target.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Locomotive-Agency-Target@locomotive-agency-target.iam.gserviceaccount.com --project=locomotive-agency-target --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Locomotive-Agency-Target.json --iam-account=Locomotive-Agency-Target@locomotive-agency-target.iam.gserviceaccount.com --project=locomotive-agency-target

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=locomotive-agency-target

# Download the service account key JSON file
cloudshell download Locomotive-Agency-Target.json
