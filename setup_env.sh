\curl -L https://get.rvm.io | bash -s stable

source ~/.bash_profile

gem source add http://ruby.taobao.org/

gem install chef --verbose

cd ../ && ln -s chef-repo /etc/chef && cd /etc/chef

chef-solo solo.rb

