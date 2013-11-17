# Simple wrapper script around git to attempt to make it more robust
# in the face of transient problems connecting to our Gitorious repository.
# Used in CI environments.

cookbook_file "/usr/local/bin/git" do
  source "gitw"
  mode "0755"
  owner "root"
end
