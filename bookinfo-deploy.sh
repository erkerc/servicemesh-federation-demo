oc create -n bookinfo -f  bookinfo/bookinfo-deployment.yaml
oc create -n bookinfo -f  bookinfo/bookinfo-gateway.yaml
oc create -n bookinfo -f  bookinfo/bookinfo-destinationrules-all-mtls.yaml
oc label deployment/productpage-v1 app.openshift.io/runtime=python
oc label deployment/reviews-v1 app.openshift.io/runtime=java
oc label deployment/reviews-v2 app.openshift.io/runtime=java
oc label deployment/reviews-v3 app.openshift.io/runtime=java
oc label deployment/ratings-v1 app.openshift.io/runtime=nodejs
oc label deployment/details-v1 app.openshift.io/runtime=ruby 
oc annotate deployment/productpage-v1 app.openshift.io/connects-to=reviews-v1,reviews-v2,reviews-v3,details-v1 --overwrite
oc annotate deployment/reviews-v2 app.openshift.io/connects-to=ratings-v1 --overwrite
oc annotate deployment/reviews-v3 app.openshift.io/connects-to=ratings-v1 --overwrite

