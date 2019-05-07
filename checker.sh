#!libs/bats/bin/bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'


# SERVER CHECK :
# - check existing mainhost account | 1
@test "check account" {
 assert_equal $(whmapi1 listaccts search=mainhost searchtype=user | awk '/result/ {print $2}') 1
}

# - check domain in for monitoring - uptime robot | WordPress
@test "check account" {
 assert_equal $(/usr/local/cpanel/3rdparty/bin/php /usr/local/cpanel/whostmgr/docroot/cgi/softaculous/cli.php --list_ins --user=mainhost | grep wp | awk '{print $4}') WordPress
}
