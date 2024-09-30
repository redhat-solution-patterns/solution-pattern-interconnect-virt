systemctl --user enable podman.socket
#loginctl enable-linger lab-user
systemctl --user start podman.socket
curl https://skupper.io/install.sh | sh -s
podman run --name portal-database --detach --rm -p 5432:5432 quay.io/redhatintegration/patient-portal-database:devnation 

podman run --name portal-payments --hostname processed-at-vmware-datacentre --detach --rm -p 8080:8080 quay.io/redhatintegration/patient-portal-payment-processor:devnation
