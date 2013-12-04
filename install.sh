set -e
echo 'Installing chef dependencies'
if [ -f /etc/redhat-release ]; then
  yum install -y make gcc gcc-c++ ruby ruby-devel ruby-irb wget ruby-shadow rubygems
fi
if [ -f /etc/debian_version ]; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y --force-yes ruby ruby-dev irb build-essential wget ssl-cert libopenssl-ruby ruby1.8-dev zlib1g-dev libxml2-dev
  (cd /tmp && rm -rf rubygems* && wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz && tar xfz rubygems-1.8.24.tgz && cd rubygems-1.8.24 && ruby setup.rb && ln -s /usr/bin/gem1.8 /usr/bin/gem)
fi
if [ ! -x /usr/bin/chef-solo ]; then
  echo -e ":sources:\n- http://rubygems.org/\n- http://dist/rubygems/\ngem: --no-ri --no-rdoc" > ~/.gemrc
  echo 'Installing chef gem'
  set +e
  attempts=0
  while [ $attempts -lt 3 ]; do
    echo "Attempt $attempts"
    gem source add http://ruby.taobao.org/
    # Need to install old version of moneta - a chef dependency. Bug here http://tickets.opscode.com/browse/CHEF-3721
    gem install --no-ri --no-rdoc moneta -v 0.6.0
    # and another one - new version of mime types is incompatible with 1.8.7
    gem install --no-ri --no-rdoc mime-types -v 1.25
    gem install --no-ri --no-rdoc chef
    if [[ $? -eq 0 ]] ; then
      break;
    fi
    attempts=$[$attempts+1]
  done
  set -e

sudo rm -rf /tmp/chef-repo /etc/chef

cp -R ../chef-repo /tmp/
sudo ln -s /tmp/chef-repo /etc/chef && cd /etc/chef
chef-solo solo.rb

