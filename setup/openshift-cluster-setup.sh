curl https://skupper.io/install.sh | sh -s
oc new-project frontend
oc apply -f https://raw.githubusercontent.com/rpscodes/Patient-Portal-Deployment/main/patient-portal-frontend-deploy.yaml