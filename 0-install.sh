#nerdctl -n k8s.io pull quay.io/ceph/ceph:v17
#nerdctl -n k8s.io pull rook/ceph:v1.10.3
#mkdir -p /private/tmp/rancher-desktop/usbdata
#kubectl apply -f common.yaml
#kubectl apply -f crds.yaml
#kubectl apply -f operator.yaml
#kubectl apply -f storageclass.yaml
#kubectl apply -f cluster-test.yaml


#LIMA_HOME="$HOME/Library/Application Support/rancher-desktop/lima" "/Applications/Rancher Desktop.app/Contents/Resources/resources/darwin/lima/bin/limactl" shell 0

#securityContext:
#  runAsNonRoot: true
#  runAsGroup: 1000
#  runAsUser: 100
#  fsGroup: 1000

#nerdctl -n k8s.io run --rm -it --entrypoint sh quay.io/ceph/ceph:v17
#dscl . list /Users uid
#dscl . list /Groups gid


#sudo dscl . create /Groups/ceph UniqueID 64045
#sudo dscl . create /Groups/ceph gid 64045

#sudo dscl . create /Users/ceph
#sudo dscl . create /Users/ceph UserShell /bin/bash
#sudo dscl . create /Users/ceph RealName "ceph"
#sudo dscl . create /Users/ceph UniqueID 64045
#sudo dscl . create /Users/ceph PrimaryGroupID 80
#sudo dscl . create /Users/ceph NFSHomeDirectory /tmp/rancher-desktop/
#sudo dscl . passwd /Users/ceph ceph
#sudo dscl . append /Groups/ceph GroupMembership ceph
#sudo dseditgroup -o edit -a ceph -t user ceph


#dscl . -read /Groups/ceph
#dscl . -read /Users/ceph


#sudo dscl . -delete /Users/ceph
#sudo dscl . -delete /Groups/ceph
#sudo chown -R ceph:ceph /tmp/rancher-desktop//usbdata/


#sudo mount -t hfs /dev/disk2s1 /private/tmp/rancher-desktop/usbdata
#sudo umount /dev/disk2s1
#sudo mkfs.exfat /dev/disk2s1
#sudo fsck /dev/disk2s1

#dscl . -create /Users/luser
#dscl . -create /Users/luser UserShell /bin/bash
#dscl . -create /Users/luser RealName "Lucius Q. User"
#dscl . -create /Users/luser UniqueID "1010"
#dscl . -create /Users/luser PrimaryGroupID 80
#dscl . -create /Users/luser NFSHomeDirectory /Users/luser

#LIMA_HOME="$HOME/Library/Application Support/rancher-desktop/lima" "/Applications/Rancher Desktop.app/Contents/Resources/resources/darwin/lima/bin/limactl" shell 0
#sudo apk add open-iscsi
#sudo rc-update add iscsid
#sudo rc-service iscsid start


#Assume that the volume is in the detached state (no workload pod is using the volume), you can:
#Go to Longhorn UI, attach the volume to node-1
#SSH into node-1. Run ls -l /dev/longhorn. You will see the block device with the name VOLUME-NAME
#Mount the block device to a directory on the node-1 by: sudo mount /dev/longhorn/<VOLUME-NAME> /mnt/
#Now you can access the data at /mnt. Try ls /mnt

nerdctl -n k8s.io pull longhornio/longhorn-manager:v1.3.2
nerdctl -n k8s.io pull longhornio/longhorn-ui:v1.3.2
nerdctl -n k8s.io pull longhornio/csi-node-driver-registrar:v2.5.0
nerdctl -n k8s.io pull longhornio/csi-provisioner:v2.1.2
nerdctl -n k8s.io pull longhornio/csi-attacher:v3.4.0
nerdctl -n k8s.io pull longhornio/csi-resizer:v1.2.0
nerdctl -n k8s.io pull longhornio/longhorn-engine:v1.3.2
nerdctl -n k8s.io pull longhornio/csi-snapshotter:v3.0.3
nerdctl -n k8s.io pull longhornio/longhorn-instance-manager:v1_20220808


kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.3.2/deploy/longhorn.yaml


# nerdctl -n k8s.io pull nginx:1.23.1-alpine
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# kubectl delete -f ingress
