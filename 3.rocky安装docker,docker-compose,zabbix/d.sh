
# install docker
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io

Docker の起動と自動起動の設定
Docker をインストール後、Docker サービスの開始と Docker サービスをシステム起動時に起動するように設定します。

sudo systemctl start docker
sudo systemctl enable docker

実行後、docker が起動していることを確認します。

systemctl status docker

# install docker-compose


sudo curl -L "https://github.com/docker/compose/releases/download/v2.14.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose


docker-compose --version
