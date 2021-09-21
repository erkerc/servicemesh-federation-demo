# Install?  Retrieve?  common root certificate authority (CA) in Red Mesh  
oc get configmap -n red-istio-system istio-ca-root-cert -o jsonpath='{.data.root-cert\.pem}' | sed ':a;N;$!ba;s/\n/\\\n      /g' > redmesh_cert

openssl x509 -in redmesh_cert -text -noout

# Install?  Retrieve?  common root certificate authority (CA) in Blue Mesh  
oc get configmap -n blue-istio-system istio-ca-root-cert -o jsonpath='{.data.root-cert\.pem}' | sed ':a;N;$!ba;s/\n/\\\n      /g' > bluemesh_cert

openssl x509 -in bluemesh_cert -text -noout


# create Blue Mesh Cert in red-istio-system
oc create cm bluemesh-ca-root-cert --from-file=root-cert.pem=bluemesh_cert -n red-istio-system

# create Red Mesh Cert in blue-istio-system
oc create cm redmesh-ca-root-cert --from-file=root-cert.pem=redmesh_cert -n blue-istio-system