\curl -L https://get.rvm.io | bash -s stable
file=~/.bash_profile
if [ -f "$file" ]; then
	source $file
fi
rvm_sh=/etc/profile.d/rvm.sh
if [ -f "$rvm_sh" ]; then
	source $rvm_sh
fi
rvm_install_on_use_flag=1
rvm reload
gem source add http://ruby.taobao.org/
sudo gem install chef --verbose --no-rdoc
sudo rm -rf /tmp/chef-repo /etc/chef
cp -R ../chef-repo /tmp/
sudo ln -s /tmp/chef-repo /etc/chef && cd /etc/chef
chef-solo solo.rb

