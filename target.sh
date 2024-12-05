#!/bin/bash

# Create a new Google Cloud project
echo "[Creating GCP Project...]"
gcloud projects create archive.bevelpr-target --name="Archive.Bevelpr-Target"
sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project
echo "[Setting up GCP Project...]"
gcloud config set project archive.bevelpr-target
sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles
echo "[Assigning Roles...]"
gcloud organizations add-iam-policy-binding 612762871216 --member="user:cloudasta@archive.bevelpr.com" --role="roles/orgpolicy.policyAdmin"
sleep 5 # Adding a delay of 5 seconds
gcloud organizations add-iam-policy-binding 612762871216 --member="user:cloudasta@archive.bevelpr.com" --role="roles/resourcemanager.projectCreator"
sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "[Disabling Policy Enforcement...]"
gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=612762871216
sleep 60 # Adding a delay of 60 seconds to allow propagation

# Create a new service account
echo "[Creating Service Account...]"
gcloud iam service-accounts create Archive.Bevelpr-Target --project=archive.bevelpr-target
sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project
echo "[Adding Policies...]"
gcloud projects add-iam-policy-binding archive.bevelpr-target --member="serviceAccount:Archive.Bevelpr-Target@archive.bevelpr-target.iam.gserviceaccount.com" --role="roles/editor"
sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account
echo "[Obtaining Unique ID...]"
gcloud iam service-accounts describe Archive.Bevelpr-Target@archive.bevelpr-target.iam.gserviceaccount.com --project=archive.bevelpr-target --format="value(uniqueId)"
sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file
echo "[Creating JSON Key...]"
gcloud iam service-accounts keys create Archive.Bevelpr-Target.json --iam-account=Archive.Bevelpr-Target@archive.bevelpr-target.iam.gserviceaccount.com --project=archive.bevelpr-target
sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services
echo "[Enabling APIs...]"
gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com forms.googleapis.com vault.googleapis.com storage-component.googleapis.com chat.googleapis.com --project=archive.bevelpr-target
sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file
echo "[Downloading JSON Key...]"
cloudshell download Archive.Bevelpr-Target.json
sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement
echo "[Re-enabling Policy Enforcement...]"
gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=612762871216
sleep 5 # Adding a delay of 5 seconds

# Tasks completed confirmation
echo "[All tasks completed.]"
sleep 5 # Adding a delay of 5 seconds
echo "Script created by Luis Melgar."