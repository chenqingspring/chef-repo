\curl -L https://get.rvm.io | bash -s stable

source ~/.bash_profile

gem source add http://ruby.taobao.org/

sudo gem install chef --verbose --no-rdoc

cd ../ && ln -s chef-repo /etc/chef && cd /etc/chef

sudo chef-solo solo.rb

