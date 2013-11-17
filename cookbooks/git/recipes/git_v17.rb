case node[:platform] 
when "debian", "ubuntu"
  cookbook_file "/etc/apt/sources.list.d/git.list" do
    source "git.list"
    mode "0644"
    owner "root"
  end

  script "apt update" do
    interpreter "bash"
    user "root"
    code <<-EOH
      apt-get update
    EOH
  end  

  package "git" do
    options "-t lenny-backports"
    version "1:1.7.2.3-2.2~bpo50+1"
    action :install
  end
end
