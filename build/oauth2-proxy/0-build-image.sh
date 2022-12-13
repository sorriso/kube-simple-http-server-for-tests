start=`date +%s`
logDate=$(date '+%Y-%m-%d')

if [ -f env ]; then
    # Load Environment Variables
    export $(cat env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

nerdctl -n k8s.io pull quay.io/oauth2-proxy/oauth2-proxy:${OAUTH2_PROXY_VERSION}

rm -f ./ca.pem
rm -f ./build.log

cp ../../../kube-vault-dockerhub/certs/ca/ca.pem ./ca.pem

nerdctl build \
   --no-cache \
   --file ./Dockerfile.quai \
   --build-arg OAUTH2_PROXY_VERSION=${OAUTH2_PROXY_VERSION} \
   --namespace k8s.io \
   --progress=plain \
   -t l_oauth2-proxy:latest . 2>&1 | tee ./build.log

end=`date +%s`

runtime=$((end-start))
runtimeh=$((runtime/60))
runtimes=$((runtime-runtimeh*60))

echo "$logDate - Total runtime was : $runtimeh minutes $runtimes seconds"
echo "" >> ./build.log
echo "$logDate - Total runtime was : $runtimeh minutes $runtimes seconds" >> ./build.log
echo ""
