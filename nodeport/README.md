# Nodeport

Create nodeport in k8s

## Apply and Delete

kubectl apply -f nodeinfo-ws-deployment.yaml
kubectl apply -f nodeinfo-ws-service.yaml

*and test by accessing ip*

kubectl delete -f nodeinfo-ws-service.yaml
kubectl delete -f nodeinfo-ws-deployment.yaml
