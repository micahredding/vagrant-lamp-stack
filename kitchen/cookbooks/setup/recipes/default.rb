# overwrite default php.ini with custom one
template "/etc/php5/conf.d/custom.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources("service[apache2]"), :delayed
end

# xdebug package
php_pear "xdebug" do
  action :install
end

# xdebug template
template "/etc/php5/conf.d/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources("service[apache2]"), :delayed
end

# php5 mysql
package "php5-mysql" do
  action :install
  notifies :restart, resources("service[apache2]"), :delayed
end

# disable default apache site
execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

# configure apache project vhost
web_app "project" do
  template "project.conf.erb"
  server_name node['hostname']
  docroot "/vagrant/public"
  set_env node['set_env']
end

# install PHPUnit
execute "pear-discover" do
  command "sudo pear config-set auto_discover 1"
end

# upgrade pear
execute "pear-upgrade" do
  command "sudo pear upgrade pear"
end

execute "phpunit" do
  command "sudo pear install pear.phpunit.de/PHPUnit"
  not_if "phpunit -v | grep PHPUnit"
end

execute "code-sniffer" do
  command "sudo pear install PHP_CodeSniffer"
  not_if "phpcs --version | grep PHP_CodeSniffer"
end

execute "phpcpd" do
  command "sudo pear install pear.phpunit.de/phpcpd"
  not_if "phpcpd -v | grep phpcpd"
end

execute "phploc" do
  command "sudo pear install pear.phpunit.de/phploc"
  not_if "phploc -v | grep phploc"
end

# install git
package "git-core"
