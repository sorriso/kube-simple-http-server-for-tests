kubectl apply -f ./simple-ingress-https-vault/pod-namespace.yaml
sleep 2

cd build/nginx

./0-build-image.sh

cd ../..

kubectl apply -f simple-ingress-https-vault
