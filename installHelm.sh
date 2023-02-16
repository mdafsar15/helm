script0='curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl";
         curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256";
	 echo "$(cat kubectl.sha256) kubectl" | sha256sum --check;
         sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl;
         kubectl version --client;
	 cd;
	 mkdir .kube;
	 apt-get install -y sshpass;
	 scp  root@172.16.200.136:/etc/kubernetes/admin.conf .kube/config;
	 ssh  root@172.16.200.136 kubectl create namespace mdm-service;
	 sed -i "s/127.0.0.1/172.16.200.136/g" .kube/config;
	 kubectl get pods;
	 curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null;
	 sudo apt-get install apt-transport-https --yes;
 echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list;
	 sudo apt-get update ;
	 sudo apt-get install helm -y;
	 helm version;
	 cd /root/mdm;
	 
	helm upgrade mdm-service mdm-service -n mdm-service;';
    #   helm delete -n mdm-service mdm-service;
	#   helm install mdm-service -n mdm-service mdm-service;';

 	ssh -p 22991 root@172.16.200.118 $script0;
