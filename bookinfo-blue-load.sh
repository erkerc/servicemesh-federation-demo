export APP_URL=$(oc get route -n blue-mesh-system |grep istio-ingressgateway-blue-mesh-system | awk '{print $2}')
while true 
do
curl -k -o /dev/null -s -w "%{http_code}\n" $APP_URL/productpage
sleep 1 
done
