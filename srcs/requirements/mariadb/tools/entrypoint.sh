#!/bin/bash

set -euo pipefail

mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db > /dev/null

exec $@
