#!/usr/bin/env bash

set -x

wget https://raw.githubusercontent.com/group-policy/gbp-devstack/master/local.conf
wget https://raw.githubusercontent.com/group-policy/gbp-devstack/master/lib/gbp -P lib/
sed -i 's/source $TOP_DIR\/lib\/neutron-legacy/source $TOP_DIR\/lib\/neutron-legacy\nsource $TOP_DIR\/lib\/gbp/g' stack.sh
sed -i 's/# Extras Configuration/\ninstall_apic_ml2\n#install_aim\n#init_aim\ninstall_gbpclient\ninstall_gbpservice\ninit_gbpservice\n\install_gbpheat\ninstall_gbpui\nsudo service apache2 restart\n# Extras Configuration/g' stack.sh
sed -i 's/echo_summary "Creating initial neutron network elements"//g' stack.sh
sed -i 's/create_neutron_initial_network//g' stack.sh
wget https://raw.githubusercontent.com/group-policy/gbp-devstack/master/exercises/gbp.sh -P exercises/
chmod +x exercises/gbp.sh
