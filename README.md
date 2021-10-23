# USAC SQUID GAME
kubectl get deployment nginx-ingress-ingress-nginx-controller -n nginx-ingress  -o yaml | linkerd inject - | kubectl apply -f -
  
for i in {0..100000}; do  curl http://34.132.113.145.nip.io/myapp; done
