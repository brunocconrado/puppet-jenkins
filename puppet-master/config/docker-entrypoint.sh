#/bin/bash
echo "Starting puppet server..."
/etc/init.d/puppetserver start
echo "Puppet status is `$(/etc/init.d/puppetserver status)`"
exec $@;