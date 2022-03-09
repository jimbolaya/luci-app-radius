#!/bin/sh

CONF="/etc/freeradius3"
INIT="/etc/init.d/radiusd"

. /lib/functions.sh
config_load radius

rebuild()
{
	clear_configure
	config_foreach append_client client
	config_foreach append_user user
	reload_radiusd
}

clear_configure()
{
	echo > $CONF/clients.extra
	echo > $CONF/authorize.extra
}

append_client()
{
	local name ipaddr secret
	config_get name $1 name
	config_get ipaddr $1 ipaddr
	config_get secret $1 secret

	cat <<-EOF >>$CONF/clients.extra
client $name {
	secret = $secret
	ipaddr = $ipaddr
	shortname = $name
}
EOF
}

append_user()
{
	local username password
	config_get username $1 username
	config_get password $1 password

	cat <<-EOF >>$CONF/authorize.extra
$username	Cleartext-Password := "$password"
EOF
}

reload_radiusd()
{
	"$INIT" restart
}

case "$1" in
  rebuild)
    rebuild
  ;;
esac
exit 0
