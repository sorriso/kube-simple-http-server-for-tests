kubectl apply -f ./simple-ingress-https-vault-sso/pod-sso-namespace.yaml
sleep 2

cd build

cd oauth2-proxy
#./0-build-image.sh
cd ..

cd nginx
#./0-build-image.sh
cd ..

cd nodejs
#./0-build-image.sh
cd ..

cd ..

kubectl apply -f simple-ingress-https-vault-sso
