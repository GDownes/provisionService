sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install mono-devel supervisor ansible sshpass -y
xbuild /p:Configuration=Release /vagrant/ProvisionService.sln
sudo mkdir /data &&  sudo cp /vagrant/provisionService/bin/Release /data/provisionService/ -R
sudo mkdir /data/provisionService/playbook &&  sudo cp /vagrant/playbook /data/provisionService/ -R
sudo cp /vagrant/config/provisionService.conf /etc/supervisor/conf.d/
sudo cp /vagrant/config/hosts /etc/ansible/
sudo cp /vagrant/config/ansible.cfg /etc/ansible/
sudo supervisorctl update