# upgrade & install depedencies
apt update && apt upgrade -y && apt dist-upgrade -y
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 net-tools
# set FQDN hostname
hostnamectl set-hostname $(curl -s http://169.254.169.254/latest/meta-data/local-hostname)
# install docker
apt install -y docker.io
systemctl stop docker
systemctl start docker
systemctl enable docker
cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sysctl --system
# install kubelet kubeadm kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt update
apt install kubelet="1.22.17-00" 
apt install kubeadm="1.22.17-00"
apt install kubectl="1.22.17-00"
cat << EOF > /etc/kubernetes/aws.yaml
---
apiVersion: kubeadm.k8s.io/v1beta2
kind: ClusterConfiguration
networking:
  serviceSubnet: "10.100.0.0/16"
  podSubnet: "10.244.0.0/16"
apiServer:
  extraArgs:
    cloud-provider: "aws"
controllerManager:
  extraArgs:
    cloud-provider: "aws"
EOF

kubeadm init --config /etc/kubernetes/aws.yaml
# save kube config
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/manifests/calico-typha.yaml
kubectl get nodes
kubectl get pods -A
kubectl get nodes
clear
kubectl get nodes
kubectl get pods -A
ls
kubectl create -f myfirstpod.yaml 
kubectl get pods -n kube-system -owide
kubectl get pods -A
kubectl get pods -owide
clear
kubectl get pods -A
clear
kubectl get pods -owide
kubectl get nodes
kubectl get pods -A
vi myfirstpod.yaml 
cat myfirstpod.yaml 
kubectl delete myfirstpod.yaml 
kubectl delete pod tomcat-jenkins
cd /etc/kubernetes/
ls
cd manifests/
ls
cd kube-apiserver.yaml
cat kube-apiserver.yaml
cd ..
ls
cat aws.yaml 
cd
vi myfirstpod.yaml 
kubectl create -f myfirstpod.yaml 
vi service.yaml
kubectl create -f service.yaml 
kubectl get services
curl -v 10.100.196.221:8080
kubectl get pods
kubectl get pods -owide
vi nodeport.yaml
kubectl create -f nodeport.yaml 
vi loadbalancer.yaml
kubectl apply -f loadbalancer.yaml 
vi loadbalancer.yaml
kubectl create  -f loadbalancer.yaml 
cd
vi exrternal.yaml
kubectl delete pod tomcat-nginx
ls
cat service.yaml 
clear
ls
cat loadbalancer.yaml 
clea
clear
ls
clear
ls
clear
ls
clear
ls
clear
ls
clear
ls
vi replicaset.yaml
kubectl create -f replicaset.yaml 
kubectl get pods
kubectl get replicaset
vi diployment.yaml
kubectl delete replicaset tomcat
kubectl get pods
vi diployment.yaml
kubectl delete deployment tomcat
vi diployment.yaml
kubectl apply -f diployment.yaml
kubectl get pods
kubectl get replicaset
kubectl get deployment
kubectl delete deployment tomcat
kubectl get namespace
vi dev-namespace.yaml
ls
kubectl get nodes
kubectl get pods
ls
vi devnamespcae.yaml 
kubectl get pods -n dev-env-namespace
kubectl apply -f myfirstpod.yaml -n dev-env-namespace
vi myfirstpod.yaml 
kubectl apply -f myfirstpod.yaml -n dev-envi-namespace
kubectl get pods -n dev-envi-namespace
kubectl delete --all
kubectl delete -all
kubectl delete - all
kubectl delete --All
kubectl delete --help
kubectl delete pods --all
kubectl delete pods --all -n dev-envi-namespace
clear
kubectl apply -f myfirstpod.yaml -n dev-envi-namespace
vi myfirstpod.yaml 
ls
vi limtrange.yaml 
kubectl apply -f myfirstpod.yaml -n dev-envi-namespace
vi myfirstpod.yaml 
kubectl get resources
kubectl get resource
kubectl get svs
kubectl get resourcequota
kubectl get resourcequota -n dev-envi-namespace
kubectl delete resourcequota -n dev-envi-namespace
kubectl delete resourcequota memory-cpu-quota -n dev-envi-namespace
kubectl delete resourcequota podquota -n dev-envi-namespace
clear
ls
kubectl get loadbalancer
kubectl get loadbalancer -n dev-envi-namespace
kubectl get limitrange -n dev-envi-namespace
kubectl get limitrange
kubectl apply -f myfirstpod.yaml -n dev-envi-namespace
kubectl get node
kubectl taint node ip-10-0-0-11.ap-south-1.compute.internal colour=red:NoSchedule
vi deployment.yaml 
kubectl 
kubectl get pods
kubectl get pods -n -owide dev-envi-namespace
vi myfirstpod.yaml 
kubectl get pods -owide -n  dev-envi-namespace
kubectl taint node ip-10-0-0-11.ap-south-1.compute.internal colour=red:NoSchedule-
history 
kubectl get pods -n dev-envi-namespace
kubectl get nodes
kubectl label node ip-10-0-0-11.ap-south-1.compute.internal.compute.internal size=small
kubectl label node ip-10-0-0-11.ap-south-1.compute.internal size=small
vi deployment.yaml 
kubectl apply -f de
kubectl apply -f deployment.yaml 
kubectl get podes -owide 
kubectl get podes -owide -n dev-envi-namespace
kubectl get pode -owide -n dev-envi-namespace

kubectl get pode -owide -n dev-envi-namespace
kubectl get pods -owide -n dev-envi-namespace
vi deployment.yaml 
kubectl delete  deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl delete -f deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pods -owide -n dev-envi-namespace
vi deployment.yaml 
kubectl apply -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pod -owide -n dev-envi-namespace
kubectl delete -f deployment.yaml 
vi deployment.yaml 
kubectl apply -f deployment.yaml 
kubectl get pod -owide -n dev-envi-namespace
kubectl delete -f deployment.yaml 
clear
cd ..
cd etc/kubernetes/
ls
vi manifests/
cd manifests/
ls
cd
ls
vi podaffinity.yaml 
cat podaffinity.yaml 
cat demonset
cat demonset.yaml 
s
ls
cat myfirstpod.yaml 
ls
vi deployment.yaml 
ls
vi deployment.yaml 
cp deployment.yaml podaffinity
ls
cat 1
cp podaffinity podaffinity.yaml
rm -rf podaffinity
ls
vi podaffinity.yaml 
kubectl delete all --all
kubectl get pods
kubectl get pods -n dev-envi-namespace
kubectl delete -f tomcat-nginx -n dev-envi-namespace 
kubectl delete tomcat-nginx -n dev-envi-namespace 
kubectl delete tomcat-nginx 
kubectl delete tomcat-nginx -n dev-envi-namespcae
kubectl delete tomcat-nginx -n dev-envi-namespace
kubectl get pods -n dev-envi-namespace
kubectl delete all --all -n dev-envi-namespace
ls
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
vi deployment.yaml 
vi podaffinity.yaml 
kubectl -f podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
vi podaffinity.yaml 
kubectl apply -f podaffinity.yaml 
kubectl get pods
kubectl get pods -n dev-envi-namespace
kubectl delete -f podaffinity.yaml -n dev-envi-namespace
ls
cp podaffinity.yaml podantiaffinity.yaml
vi podantiaffinity.yaml 
kubectl apply -f podantiaffinity.yaml 
kubectl get pods
kubectl get pods -n dev-envi-namespace
kubectl delete podantiaffinity.yaml 
kubectl delete -f podantiaffinity.yaml 
vi podantiaffinity.yaml 
kubectl apply -f podantiaffinity.yaml 
kubectl get pods -n dev-envi-namespace
kubectl delete -f dev-envi-namespace
kubectl delete -f podantiaffinity.yaml 
ls
cp podaffinity.yaml demonset.yaml
vi demonset.yaml 
kubectl apply -f demonset.yaml 
kubectl get pods -n dev-envi-namespace
ls
vi myfirstpod.yaml 
kubectl -f apply myfirstpod.yaml 
kubectl apply -f  myfirstpod.yaml 
kubectl get pods
kubectl get pods -n dev-envi-namespcae
kubectl get pods
kubectl get pods -n dev-envi-namespace
kubectl delete -f replicaset.yaml 
kubectl delete -f replicaset.yaml -n dev-envi-namespcae
kubectl delete -f replicaset.yaml -n dev-envi-namespace
kubectl delete -f demonset.yaml -n dev-envi-namespace
kubectl get pods
kubectl get pods -n dev-envi-namespcae
kubectl get pods -n dev-envi-namespcace
kubectl delete all --all
kubectl delete all --all -n dev-envi-namespace
kubectl create -f myfirstpod.yaml 
kubectl get nodes
kubectl get npods
kubectl get pods
vi myfirstpod.yaml 
kubectl get pods -n dev-envi-namespace
kubectl get pods tomcat-nginx -n dev-envi-namespce
kubectl get pods tomcat-nginx -n dev-envi-namespace
kubectl get describe tomcat-nginx -n dev-envi-namespace
kubectl describe pod tomcat-nginx -n dev-envi-namespace
vi demonset.yaml 
cp demonset.yaml demonset1.yaml
vi demonset1.yaml 
kubectl delete -f demonset.yaml 
kubectl delete -f demonset.yaml -n dev-envi-namespace
kubectl delete demonset.yaml 
kubectl delete -f demonset.yaml 
kubectl delete -f demonsets.yaml 
ls
kubectl get pods tomcat-nginx -n dev-envi-namespcae
kubectl get pods tomcat-nginx -n dev-envi-namespace
vi demonset.yaml 
kubectl delete all --a
kubectl delete all --all
kubectl delete all --all -n dev-envi-namespace
kubectl apply -f demonset1.yaml 
vi demonset1.yaml 
kubectl apply -f demonset1.yaml 
kubectl describe pod tomcat-nginx -n dev-envi-namespace
kubectl describe pod tomcat -n dev-envi-namespace
kubectl delete -f tomcat
kubectl delete -f tomcat -n dev-envi-namespace
kubectl delete -f demonset1.yaml -n dev-envi-namespace
vi demonset.yaml 
vi demonset1.yaml 
kubectl apply -f demonset1.yaml 
kubectl describe pod tomcat -n dev-envi-namespace
kubectl delete -f demonset1.yaml -n dev-envi-namespace
clear
ls
vi podantiaffinity.yaml 
cd etc
cd etc/
vi etc/
sudo su -
ls
df -h
ls
kubectl get label
kubectl get label --show
touch jenkinsdata.yaml
vi jenkinsdata.yaml 
kubectl apply -f jenkinsdata.yaml 
kubectl get pods
kubectl delete -f jenkinsdata.yaml 
kubectl apply -f jenkinsdata.yaml 
kubectl get pods
kubectl delete -f jenkinsdata.yaml 
vi jenkinsdata.yaml 
kubectl apply -f jenkinsdata.yaml 
kubectl get pods
ls
vi jenkinsdeploy.yaml
vi jenkinsd
vi jenkinsdeploy.yaml 
kubectl apply -f jenkinsdeploy.yaml 
kubectl get pods
kubectl get pods -n dev-envi-namespace
vi jenkinsdeploy.yaml 
kubectl delete -f jenkinsdeploy.yaml 
kubectl apply -f jenkinsdeploy.yaml 
kubectl get pods -n dev-envi-namespace
kubectl exec -it jenkins-665648dd94-77bzh -n dev-envi-namespace --/bin/sh
kubectl exec -it jenkins-665648dd94-77bzh -n dev-envi-namespace -- /bin/sh
ls
vi configmap.yaml
kubectl apply -f configmap.yaml 
vi configmap.yaml 
kubectl apply -f configmap.yaml 
vi configpod.yaml
kubectl apply -f configpod.yaml 
kubectl exec -it configmap-demo-pod -- /bin/sh
kubectl delete all --all
kubectl get pods
kubectl get pods -n dev-envi-namespace
kebectl delete all --all dev-envi-namespace
kebectl delete all --all -n dev-envi-namespace
kubectl delete all --all -n dev-envi-namespace
kubectl get pods -n dev-envi-namespace
vi secret.yaml
kubectl apply -f secret.yaml 
vi secret.yaml 
kubectl get Secret
kubectl get Secret mysecret -oyaml
echo "MWYyZDFlMmU2N2Rm" | base64 --decode
echo "YWRtaW4=" | base64 --decode
echo "neil" | base64 
vi secret.yaml 
kubectl apply -f secret.yaml 
kubectl create secret generic db-user-pass     --from-literal=username=admin     --from-literal=password='S!B\*d$zDsb='
kubectl get secret
kubectl get Secret db-user-pass -oyaml
vi username.txt
vi password.txt
kubectl create secret generick mysecretfiles --from-file=./username.txt --from-file=./password.txt
kubectl create secret generic mysecretfiles --from-file=./username.txt --from-file=./password.txt
kubectl get secret mysecretfile -oyaml
kubectl get secrets mysecretfile -oyaml
kubectl get secrets mysecretfiles -oyaml
echo "cGFzc3dvcmQgZmlsZSAK" | base64 --decode
vi secretpod.yaml
kubectl get secret
vi secretpod.yaml
ls
vi myfirstpod.yaml 
vi secretpod.yaml
kubectl apply -f secretpod.yaml 
vi secretpod.yaml
kubectl apply -f secretpod.yaml 
kubectl exec -it secretpod.yaml -- /bin/sh
kubectl exec -it secret-test-pod -- /bin/sh
ls
vi jenkinsd
vi jenkinsdeploy.yaml 
df -h
cd /opt/
kubectl get nodes
kubectl get pods
kubectl get pods -n dev-envi-namespace
cd
kubectl get cm
ls
kubectl apply -f configmap.yaml 
kubectl get cm
kubectl get cm -n dev-envi-namspce
kubectl get cm -n dev-envi-namspace
kubectl get cm -n dev-envi-namespace
kubectl get cm game-demo -oyaml
sudo su -
history
vi secretpod.yaml 
kubectl get Secret mysecret -oyaml
echo "bmVpbAo=" | base64 --decode
echo "YWRtaW4=" | base64 --decode
kubectl get secret mysecretfile -oyaml
kubectl get secrets mysecretfiles -oyaml
clear
kubectl get secrets mysecretfiles -oyaml
echo "cGFzc3dvcmQgZmlsZSAK" | base64 --decode
echo "amFuCmZlYgptYXJjaAphcHJpbAo=" | base64 --decode
kubectl get cm -n dev-envi-namspace
kubectl get cm game-demo -oyaml
cd ..
cd /opt/
mkdir efs
apt-get -y install nfs-common
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-012b2d3537697588c.efs.ap-south-1.amazonaws.com:/ efs
df -h
cd
kubectl get pods
kubectl get pods -n dev-envi-namespace
vi jenkinsdeploy.yaml 
kubectl apply -f jenkinsdeploy.yaml 
kubectl get pods
kubectl get pods -n dev-envi-namespace
vi jenkinsdeploy.yaml 
kubectl get pods -n dev-envi-namespace
kubectl delete jenkinsdeploy.yaml -n dev-envi-namespace
kubectl delete jenkins-784f8fd569-5tdtb -n dev-envi-namespace
kubectl delete jenkinsdeploy.yaml 
kubectl delete -f jenkinsdeploy.yaml 
kubectl apply -f jenkinsdeploy.yaml 
kubectl get pods -n dev-envi-namespace
kubectl delete -f jenkinsdeploy.yaml 
ls
kubectl get nodes
df -h
cd /opt/
ls
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-012b2d3537697588c.efs.ap-south-1.amazonaws.com:/ efs
df -h
cd
vi jenkinsdeploy.yaml 
kubectl gwt pods
kubectl get pods
kubectl apply -f jenkinsdeploy.yaml 
kubectl get pods
kubectl get pods -n dev-envi-namespace
kubectl get nodes
ls
cat configmap.yaml 
vi configmap.yaml 
vi storage.yaml
kubectl get nodes
kubectl get podes
kubectl get pods
kubectl get pods -n dev-envi-namespace
kubectl delete all --all -n dev-envi-namespace
kubectl get pods -n dev-envi-namespace
kubectl get deployment.yaml 
clear
ls
mv storage.yaml storageclass.yaml
ls
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.14"
kubectl get pods -A
kubectl delete all --all
kubectl get pods -A
kubectl delete pod calico-kube-controllers-68d86f8988-vczjq 
kubectl delete pod calico-kube-controllers-68d86f8988-vczjq  -n kube-system
kubectl delete all --all -n kube-system
kubectl get pods -A
kubectl get nodes
kubectl get pods -A

kubectl get pods -A
ls
kubectl apply -f myfirstpod.yaml 
kubectl get pods
kubectl get pods -n dev-envi-namespace
kubectl delete pods -n dev-envi-namespace
kubectl get pods -A
kubectl delete all --all -n dev-envi-namespace
ls
vi pv.yaml
kubectl apply -f pv.yaml 
vi pv.yaml
kubectl apply -f pv.yaml 
kubectl get pv~
kubectl get pv
vi pvc.yaml
kubectl apply -f pvc.yaml 
vi staticpod.yaml
kubectl apply -f staticpod.yaml 
kubectl get pv
kubectl get pvc
Kubectl get pods
kubectl get pods
kubectl describe pod app
kubectl get pods
clear
kubectl get pods
kubectl describe pod app
kubectl get pods -A
vi pv.yaml 
kubectl get pods -A
kubectl get pods
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.14"
kubectl get pods -A
aws-ebs-csi-driver
kubectl delete aws-ebs-csi-driver
kubectl delete ebs-csi-driver
rm -rf ebs-csi-driver
kubectl get pods -A
ls
kubectl get pods -A
