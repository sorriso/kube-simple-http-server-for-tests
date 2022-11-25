kubectl apply -f ./simple-ingress-https-vault/pod-namespace.yaml
sleep 2

cd build/nginx

./0-build-image.sh

cd ../..

kubectl delete secret -n test-ingress-https-vault pod-test-ingress-https-vault-secret

kubectl create secret generic pod-test-ingress-https-vault-secret -n test-ingress-https-vault \
--from-file="SSL_CERT_BUNDLE=../kube-vault-dockerhub/certs/subca-cert-simple/bundle.pem" \
--from-file="SSL_CERT_PRIVKEY=../kube-vault-dockerhub/certs/subca-cert-simple/simple-key.pem"

kubectl apply -f simple-ingress-https-vault
