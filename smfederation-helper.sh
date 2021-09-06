

# Install?  Retrieve?  common root certificate authority (CA) in Red Mesh  
export REDMESH_CERT=$(oc get configmap -n red-mesh istio-ca-root-cert -o jsonpath='{.data.root-cert\.pem}' | sed ':a;N;$!ba;s/\n/\\\n      /g')
echo $REDMESH_CERT > redmesh_cert
# Install?  Retrieve?  common root certificate authority (CA) in Blue Mesh  
export BLUEMESH_CERT=$(oc get configmap -n blue-mesh istio-ca-root-cert -o jsonpath='{.data.root-cert\.pem}' | sed ':a;N;$!ba;s/\n/\\\n      /g')
echo $BLUEMESH_CERT > bluemesh_cert

# create Blue Mesh Cert in red-istio-system
oc create cm bluemesh-ca-root-cert --from-file=root-cert.pem=bluemesh_cert -n red-mesh

# create Red Mesh Cert in blue-istio-system
oc create cm redmesh-ca-root-cert --from-file=root-cert.pem=redmesh_cert -n blue-mesh