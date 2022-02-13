yum install -y python3
sudo -u centos pip3 install aws-sam-cli --user
yum install -y git
yum install -y zip unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
cd awscliv2
./aws/install
yum install -y yum-utils
yum-config-manager \
--add-repo \
https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
usermod -a -G docker centos
git config --global user.name "Hugo Tse"
git config --global user.email hugotkk@live.hk
