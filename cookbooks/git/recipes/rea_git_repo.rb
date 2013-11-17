directory "#{node.rea.git.user_home}" do
  owner node.rea.git.username
  group node.rea.git.usergroup
  mode "0755"
  action :create
  not_if "test -d #{node.rea.git.user_home}", :user => node.rea.git.username
end

cookbook_file "#{node.rea.git.user_home}/id_rsa" do
  source "rea_git_ssh_files/id_rsa"
  mode "0600"
  owner node.rea.git.username
  group node.rea.git.usergroup
end

cookbook_file "#{node.rea.git.user_home}/config" do
  source "rea_git_ssh_files/config"
  mode "0644"
  owner node.rea.git.username
  group node.rea.git.usergroup
end

cookbook_file "#{node.rea.git.user_home}/known_hosts" do
  source "rea_git_ssh_files/known_hosts"
  mode "0644"
  owner node.rea.git.username
  group node.rea.git.usergroup
end
