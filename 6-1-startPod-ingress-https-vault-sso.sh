kubectl apply -f ./simple-ingress-https-vault-sso/pod-namespace.yaml
sleep 2

cd build

cd openresty
./0-build-image.sh
cd ..

cd nginx
#./0-build-image.sh
cd ..

cd ..

kubectl apply -f simple-ingress-https-vault-sso
