#!/usr/bin/env bash

set -x

wget https://raw.githubusercontent.com/group-policy/devstack/kilo-gbp/local.conf
wget https://raw.githubusercontent.com/group-policy/devstack/kilo-gbp/lib/gbp -P lib/
sed -i 's/source $TOP_DIR\/lib\/neutron-legacy/source $TOP_DIR\/lib\/neutron-legacy\nsource $TOP_DIR\/lib\/gbp/g' stack.sh
sed -i 's/# Extras Configuration/install_gbpclient\ninstall_gbpservice\ninit_gbpservice\n\install_gbpheat\ninstall_gbpui\nsudo service apache2 restart\n# Extras Configuration/g' stack.sh
sed -i 's/echo_summary "Creating initial neutron network elements"//g' stack.sh
sed -i 's/create_neutron_initial_network//g' stack.sh
wget https://raw.githubusercontent.com/group-policy/devstack/kilo-gbp/exercises/gbp.sh -P exercises/
chmod +x exercises/gbp.sh
