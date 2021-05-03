# Theia helm chart

This is a Helm chart for theia.

```
helm install --name theia-helm --namespace theia ./theia
helm upgrade --set userid=`id -u` --set groupid=`id -g` theia-helm ./theia
```