export APP_URL=$(oc get route -n blue-mesh |grep istio-ingressgateway-blue| awk '{print $2}')
while true 
do
curl -k -o /dev/null -s -w "%{http_code}\n" $APP_URL/productpage
sleep 2 
done
