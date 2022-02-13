sudo yum install -y python3
sudo -u centos pip3 install aws-sam-cli --user
sudo yum install -y git
sudo yum install -y zip unzip
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
cd awscliv2
sudo ./aws/install
sudo yum install -y yum-utils
sudo yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -a -G docker centos
sudo -u centos git config --global user.name "Hugo Tse"
sudo -u centos git config --global user.email hugotkk@live.hk
