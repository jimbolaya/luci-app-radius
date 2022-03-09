# luci-app-radius
OpenWrt Radius Server. Easy deployment, Easy management.
Enterprise-class protection your WiFi security.

This is based on the original app from Jason Tse <jasontsecode@gmail.com>

I have updated what I can for Freeradius 3. Unlike the original app, this does not create a basic configuration for you. You will want to go through the OpenWRT wiki on Freeradius3 at https://openwrt.org/docs/guide-user/network/wifi/freeradius

You will also need to install luci-compat

When you're done with that and have sucessfully tested connecting a WiFi client, you will want to add 

`$INCLUDE clients.extra`

to the end of `/etc/freeradius3/clients.conf`

and 

`$INCLUDE /etc/freeradius3/authorize.extra`

to the top of `/etc/freeradius3/mods-config/files/authorize`
