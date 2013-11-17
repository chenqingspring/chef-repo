\curl -L https://get.rvm.io | bash -s stable

source ~/.bash_profile

gem source add http://ruby.taobao.org/

sudo gem install chef --verbose --no-rdoc

sudo rm -rf /tmp/chef-repo /etc/chef

cp -R ../chef-repo /tmp/

sudo ln -s /tmp/chef-repo /etc/chef && cd /etc/chef

chef-solo solo.rb

