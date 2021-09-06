#export GATEWAY_URL=http://bookinfo-bookinfo-gateway-lh2rt-istio-tutorial.apps.cluster-ist-6c27.ist-6c27.example.opentlc.com
export APP_URL=$(oc get route -n red-mesh |grep istio-ingressgateway-red| awk '{print $2}')
while true 
do
curl -k -o /dev/null -s -w "%{http_code}\n" $APP_URL/productpage
sleep 2 
done
