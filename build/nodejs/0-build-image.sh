start=`date +%s`
logDate=$(date '+%Y-%m-%d')

if [ -f env ]; then
    # Load Environment Variables
    export $(cat env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
fi

nerdctl -n k8s.io pull node:${NODEJS_VERSION}
nerdctl -n k8s.io pull gcr.io/distroless/nodejs:${DISTROLESS_VERSION}

rm -f ./ca.pem
rm -f ./build.log

cp ../../../kube-vault-dockerhub/certs/ca/ca.pem ./ca.pem

nerdctl build \
   --no-cache \
   --file ./Dockerfile.quai \
   --build-arg NODEJS_VERSION=${NODEJS_VERSION} \
   --build-arg DISTROLESS_VERSION=${DISTROLESS_VERSION} \
   --namespace k8s.io \
   --progress=plain \
   -t l_nodejs:latest  . 2>&1 | tee ./build.log

end=`date +%s`

runtime=$((end-start))
runtimeh=$((runtime/60))
runtimes=$((runtime-runtimeh*60))

echo "$logDate - Total runtime was : $runtimeh minutes $runtimes seconds"
echo "" >> ./build.log
echo "$logDate - Total runtime was : $runtimeh minutes $runtimes seconds" >> ./build.log
echo ""
