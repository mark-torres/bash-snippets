#!/bin/bash
NOW=$(date +%y%m%d@%H%M%S)
COOKIE_FILE=cookies_${NOW}.txt
FORM_FILE=form_${NOW}.html
LAND_FILE=land_${NOW}.html
PROTECTED_FILE=protected_${NOW}.html

# load login page
curl 'http://www.tvshowtime.com/en' \
	--compressed --location \
	--cookie-jar $COOKIE_FILE \
	-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:53.0) Gecko/20100101 Firefox/53.0' \
	-o $FORM_FILE

# atempt to login
curl 'http://www.tvshowtime.com/signin' \
	--compressed --location \
	--cookie $COOKIE_FILE \
	--cookie-jar $COOKIE_FILE \
	-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:53.0) Gecko/20100101 Firefox/53.0' \
	-H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
	--data 'username=markushi&password=mysecretpass&redirect_path=http%3A%2F%2Fwww.tvshowtime.com%2Fen' \
	-o $LAND_FILE

# read protected page
curl 'https://www.tvshowtime.com/en/user/666696/account' \
	--compressed --location \
	--cookie $COOKIE_FILE \
	--cookie-jar $COOKIE_FILE \
	-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:53.0) Gecko/20100101 Firefox/53.0' \
	-o $PROTECTED_FILE