oc create -n $1-bookinfo -f  bookinfo/bookinfo-deployment.yaml
oc create -n $1-bookinfo -f  bookinfo/bookinfo-gateway.yaml
oc create -n $1-bookinfo -f  bookinfo/bookinfo-destinationrules-all-mtls.yaml
