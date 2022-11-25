kubectl apply -f ./simple-ingress-https/pod-namespace.yaml
sleep 2

cd build/nginx

./0-build-image.sh

cd ../..

kubectl delete secret -n test-ingress-https pod-test-ingress-https-secret

kubectl create secret generic pod-test-ingress-https-secret -n test-ingress-https \
--from-file="ca.pem=../kube-vault-dockerhub/certs/ca/ca.pem" \
--from-file="crt.pem=../kube-vault-dockerhub/certs/subca-cert-simple/bundle.pem" \
--from-file="crt.key=../kube-vault-dockerhub/certs/subca-cert-simple/simple-key.pem"

kubectl apply -f simple-ingress-https
