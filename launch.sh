# Go to the infra folder to reach the terraform files
cd ./infra

# Initialize terraform and apply the configuration (mainly install Docker if needed)
terraform init

# Apply the configuration (launch the docker and run the application)
terraform apply

# Open the application in the browser on localhost:8000
open http://localhost:8000