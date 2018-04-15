#!/bin/sh
# ============================================================
#  Author: Chu-Siang Lai / chusiang (at) drx.tw
#  Blog: http://note.drx.tw
#  Filename: docker-entrypoint.sh
#  Modified: 2018-04-15 16:28
#  Description: Run the php-fpm service.
# =========================================================== 

# Start service.
service php7.0-fpm start

# loop.
tail -f /dev/null
