# gbp-devstack
Install stable/kilo devstack with GBP.

0. Install Ubuntu 14.04

1. git clone https://git.openstack.org/openstack-dev/devstack -b stable/kilo

2. cd devstack

3. wget https://raw.githubusercontent.com/group-policy/gbp-devstack/kilo/gbp-patch.sh

4. chmod +x gbp-patch.sh

5. ./gbp-patch.sh

6. ./stack.sh

To verify installation run:

exercises/gbp.sh
