#!/bin/bash

# Create a new Google Cloud project
gcloud projects create finn-partners-target --name="Finn-Partners-Target"

# Set the current Google Cloud project
gcloud config set project finn-partners-target

# Create a new service account
gcloud iam service-accounts create Finn-Partners-Target --project=finn-partners-target

# Add IAM policy binding to the project
gcloud projects add-iam-policy-binding finn-partners-target --member="serviceAccount:Finn-Partners-Target@finn-partners-source.iam.gserviceaccount.com" --role="roles/owner"

# Get the unique ID of the service account
gcloud iam service-accounts describe Finn-Partners-Target@finn-partners-target.iam.gserviceaccount.com --project=finn-partners-target --format="value(uniqueId)"

# Create a service account key and save it to a JSON file
gcloud iam service-accounts keys create Finn-Partners-Target.json --iam-account=Finn-Partners-Target@finn-partners-target.iam.gserviceaccount.com --project=finn-partners-target

# Enable necessary Google services
gcloud services enable admin.googleapis.com drive.googleapis.com gmail.googleapis.com calendar-json.googleapis.com people.googleapis.com tasks.googleapis.com forms.googleapis.com groupsmigration.googleapis.com vault.googleapis.com storage-component.googleapis.com --project=finn-partners-target

# Download the service account key JSON file
cloudshell download Finn-Partners-Target.json
