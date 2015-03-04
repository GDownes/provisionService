#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
#echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
#sudo apt-get update
#sudo apt-get install mono-complete -y
#cd /vagrant
#xbuild /p:Configuration=Release ProvisionService.sln
#sudo apt-get install supervisor -y
#sudo cp /vagrant/provisionService.conf /etc/supervisor/conf.d/
#sudo supervisorctl update
#sudo supervisorctl start provisionService


#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
#echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
#echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
#sudo apt-get update
#sudo apt-get install mono-complete -y
#cd /vagrant
#xbuild /p:Configuration=Release ProvisionService.sln
#sudo apt-get install supervisor -y
#sudo cp /vagrant/provisionService.conf /etc/supervisor/conf.d/
#sudo supervisorctl -c /vagrant/provisionService.conf update
#sudo supervisorctl start provisionService

#sudo yum install yum-utils epel-release gcc gcc-c++ libtool bison autoconf automake gettext -y
#cd /usr/src
#sudo wget http://download.mono-project.com/sources/mono/mono-3.0.7.tar.bz2
#sudo tar -xvjf mono-3.0.7.tar.bz2
#cd mono-3.0.7
#sudo ./configure --prefix=/usr
#sudo make && sudo make install
#cd /vagrant
#xbuild /p:Configuration=Release ProvisionService.sln

sudo yum install epel-release -y
sudo yum install mono-devel supervisor nano -y
cd /vagrant
xbuild /p:Configuration=Release ProvisionService.sln
cat /vagrant/provisionService.conf | sudo tee -a /etc/supervisord.conf
sudo supervisorctl update
sudo supervisorctl start provisionService


