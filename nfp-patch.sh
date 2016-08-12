#!/usr/bin/env bash

set -x

rm -rf local.*
wget -O local.conf https://raw.githubusercontent.com/group-policy/gbp-devstack/liberty/nfp-local.conf
wget https://raw.githubusercontent.com/group-policy/gbp-devstack/liberty/lib/nfp -P lib/

sed -i 's/source $TOP_DIR\/lib\/dstat/source $TOP_DIR\/lib\/dstat\nsource $TOP_DIR\/lib\/nfp/g' stack.sh
sed -i "s/install_gbpservice/install_gbpservice\n[[ \$NFP_DEVSTACK_MODE = advanced ]] \&\& configure_nfp_loadbalancer\n[[ \$NFP_DEVSTACK_MODE = advanced ]] \&\& configure_nfp_vpn\n/g" stack.sh
sed -i "s/start_neutron_service_and_check/[[ \$NFP_DEVSTACK_MODE = advanced ]] \&\& configure_nfp_firewall\n    start_neutron_service_and_check/g" stack.sh
sed -i 's/# Restore\/close logging file descriptors/nfp_setup\n# Restore\/close logging file descriptors/g' stack.sh
sed -i 's/merge_config_group \$TOP_DIR\/local.conf post-config/merge_config_group \$TOP_DIR\/local.conf post-config\n[[ $ENABLE_NFP = False ]] \&\& merge_config_group \$TOP_DIR\/local.conf post-config-gbp\n[[ $ENABLE_NFP = True ]] \&\& merge_config_group \$TOP_DIR\/local.conf post-config-nfp/' stack.sh

