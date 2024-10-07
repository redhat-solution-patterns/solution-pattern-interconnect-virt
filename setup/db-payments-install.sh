ARCH=$(uname -m)

if [[ "$ARCH" == *x86* ]]; then
    echo "Running on x86 architecture..."
    podman run --name portal-database --detach --rm -p 5432:5432 --network skupper quay.io/redhatintegration/patient-portal-database:devnation
    podman run --name portal-payments --hostname processed-at-openshift-virt --detach --rm -p 8080:8080 --network skupper quay.io/redhatintegration/patient-portal-payment-processor:devnation
else
    echo "Running on ARM architecture..."
    podman run --name portal-database --detach --rm -p 5432:5432 --network skupper quay.io/redhatintegration/patient-portal-database-arm64:latest
    podman run --name portal-payments --hostname processed-at-openshift-virt --detach --rm -p 8080:8080 --network skupper quay.io/redhatintegration/patient-portal-payment-processor-arm64:latest
fi