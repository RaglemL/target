#!/bin/bash

# Create a new Google Cloud project

gcloud projects create paranguaracutirimicoro-target --name="Paranguaracutirimicoro-Target"

sleep 5 # Adding a delay of 5 seconds

# Set the current Google Cloud project

gcloud config set project paranguaracutirimicoro-target

sleep 5 # Adding a delay of 5 seconds

# Provide yourself Organization Policy Administrator and Project Creator roles

gcloud organizations add-iam-policy-binding 605938502182 --member="user:cloudasta@go-rollingsuds.net" --role="roles/orgpolicy.policyAdmin"

gcloud organizations add-iam-policy-binding 605938502182 --member="user:cloudasta@go-rollingsuds.net" --role="roles/resourcemanager.projectCreator"

sleep 5 # Adding a delay of 5 seconds

# Disable the constraint iam.disableServiceAccountKeyCreation enforcement

gcloud resource-manager org-policies disable-enforce iam.disableServiceAccountKeyCreation --organization=605938502182

sleep 5 # Adding a delay of 5 seconds

# Create a new service account

gcloud iam service-accounts create Paranguaracutirimicoro-Target --project=paranguaracutirimicoro-target

sleep 5 # Adding a delay of 5 seconds

# Add IAM policy binding to the project

gcloud projects add-iam-policy-binding paranguaracutirimicoro-target --member="serviceAccount:Paranguaracutirimicoro-Target@paranguaracutirimicoro-target.iam.gserviceaccount.com" --role="roles/editor"

sleep 5 # Adding a delay of 5 seconds

# Get the unique ID of the service account

gcloud iam service-accounts describe Paranguaracutirimicoro-Target@paranguaracutirimicoro-target.iam.gserviceaccount.com --project=paranguaracutirimicoro-target --format="value(uniqueId)"

sleep 5 # Adding a delay of 5 seconds

# Create a service account key and save it to a JSON file

gcloud iam service-accounts keys create Paranguaracutirimicoro-Target.json --iam-account=Paranguaracutirimicoro-Target@paranguaracutirimicoro-target.iam.gserviceaccount.com --project=paranguaracutirimicoro-target

sleep 5 # Adding a delay of 5 seconds

# Enable necessary Google services

gcloud services enable drive.googleapis.com sheets.googleapis.com admin.googleapis.com people.googleapis.com contacts.googleapis.com migrate.googleapis.com gmail.googleapis.com calendar-json.googleapis.com groupsmigration.googleapis.com groupssettings.googleapis.com tasks.googleapis.com --project=paranguaracutirimicoro-target

sleep 5 # Adding a delay of 5 seconds

# Download the service account key JSON file

cloudshell download Paranguaracutirimicoro-Target.json

sleep 5 # Adding a delay of 5 seconds

# Enable the constraint iam.disableServiceAccountKeyCreation enforcement

gcloud resource-manager org-policies enable-enforce iam.disableServiceAccountKeyCreation --organization=605938502182

sleep 5 # Adding a delay of 5 seconds
