# gbp-devstack
Install stable/liberty devstack with GBP.

0. Install Ubuntu 14.04

1. git clone https://git.openstack.org/openstack-dev/devstack -b stable/liberty

2. cd devstack

3. wget https://raw.githubusercontent.com/group-policy/gbp-devstack/liberty/gbp-patch.sh

4. chmod +x gbp-patch.sh

5. ./gbp-patch.sh

6. ./stack.sh

To verify installation run:

exercises/gbp.sh


# nfp-devstack
Install stable/liberty devstack with NFP.

0. Install Ubuntu 14.04

1. git clone https://git.openstack.org/openstack-dev/devstack -b stable/liberty

2. cd devstack

3. wget https://raw.githubusercontent.com/group-policy/gbp-devstack/liberty/gbp-patch.sh

4. chmod +x gbp-patch.sh

5. ./gbp-patch.sh

6. wget https://raw.githubusercontent.com/group-policy/gbp-devstack/liberty/nfp-patch.sh

7. chmod +x nfp-patch.sh

8. ./nfp-patch.sh 

9. edit local.conf for NFP

    * Base Mode Configuration:
        * Zero Configuration

    * Advanced Mode Configuration:
        * Devstack installation mode advanced/base

            NFP_DEVSTACK_MODE=base

        * External network details

            EXT_NET_GATEWAY=    
            EXT_NET_ALLOCATION_POOL_START=    
            EXT_NET_ALLOCATION_POOL_END=    
            EXT_NET_CIDR=    

        * Configurator VM image path, its optional
        * If configured, install step uploads the specified image
        * If not configured, install step will build a new one and upload it

            ConfiguratorQcow2Image=

        * Service VM image paths, they are optional
        * If configured, install step uploads the specified images
        * If not configured, install step ignores uploading these service images.

            VyosQcow2Image=    
            HaproxyQcow2Image=    

        * Public interface name

            PUBLIC_INTERFACE=

10. ./stack.sh

