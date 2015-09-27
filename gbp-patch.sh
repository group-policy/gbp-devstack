#!/usr/bin/env bash

set -x

wget https://raw.githubusercontent.com/group-policy/devstack/sumit/test/stable/juno-gbp/local.conf
wget https://raw.githubusercontent.com/group-policy/devstack/sumit/test/stable/juno-gbp/lib/gbp -P lib/
sed -i 's/# Extras Configuration/source $TOP_DIR\/lib\/gbp\ninstall_gbpclient\ninstall_gbpservice\ninit_gbpservice\n\install_gbpheat\ninstall_gbpui\n# Extras Configuration/g' stack.sh
sed -i 's/echo_summary "Creating initial neutron network elements"//g' stack.sh
sed -i 's/create_neutron_initial_network//g' stack.sh
wget https://raw.githubusercontent.com/group-policy/devstack/sumit/test/stable/juno-gbp/exercises/gbp.sh -P exercises/
chmod +x exercises/gbp.sh
