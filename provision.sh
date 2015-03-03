sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install mono-complete -y
cd /vagrant
xbuild /p:Configuration=Release ProvisionService.sln
sudo apt-get install supervisor -y
sudo cp /vagrant/provisionService.conf /etc/supervisor/conf.d/
sudo supervisorctl
update
start provisionService
exit