#!/bin/bash

# Create a new Google Cloud project
gcloud projects create admin-salesdeskco-target --name="Admin-Salesdeskco-Target"

# Set the current Google Cloud project
gcloud config set project admin-salesdeskco-target

# Create a new service account
gcloud iam service-accounts create Admin-Salesdeskco-Target --project=admin-salesdeskco-target

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding admin-salesdeskco-target --member="serviceAccount:Admin-Salesdeskco-Target@admin-salesdeskco-target.iam.gserviceaccount.com" --role="roles/editor"

# Get the unique ID of the service account
gcloud iam service-accounts describe Admin-Salesdeskco-Target@admin-salesdeskco-target.iam.gserviceaccount.com --project=admin-salesdeskco-target --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Admin-Salesdeskco-Target.json --iam-account=Admin-Salesdeskco-Target@admin-salesdeskco-target.iam.gserviceaccount.com --project=admin-salesdeskco-target

# Enable necessary Google services
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=admin-salesdeskco-target

# Download the service account key JSON file
cloudshell download Admin-Salesdeskco-Target.json
