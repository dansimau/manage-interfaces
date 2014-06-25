`manage-interfaces`
===================

`manage-interfaces` is a lightweight script for managing network interface config for
Debian-flavoured distros by combining split config from `/etc/network/interfaces.d/*`.


Features
--------

 * Have multiple configs for a given interface, and easily switch between them
 * Bring up entire network to a known good configuration from scratch,
   regardless of previous state (i.e. a more robust
   `/etc/init.d/networking restart`)


How it works
------------

Interface configurations are stored at:

    /etc/network/interfaces.d/<ifname>

This can be a regular file, or a symlink.

When generating the `/etc/network/interfaces` file, all config files are
concatenated together and saved.

Any configs for interfaces that do not exist on the
system are ignored.


Named config
------------

Multiple named versions of an interface config can be stored at:

    /etc/network/interfaces.d/<ifname>_<configname>

E.g.:

    /etc/network/interfaces.d/eth0_default
    /etc/network/interfaces.d/eth0_gateway

You can use the `set` command to switch between these configs:

    manage-interfaces set eth0 gateway

This creates a symlink to the relevant config file:

  `/etc/network/interfaces.d/eth0 -> /etc/network/interfaces.d/eth0_gateway`

You can then apply this configuration to the system:

    manage-interfaces save
    manage-interfaces reconfigure


Full help & usage
-----------------

Usage:

    Usage: ./manage-interfaces set <ifname> <config>
           ./manage-interfaces show
           ./manage-interfaces save
           ./manage-interfaces reconfigure

Help on commands:

    set <ifname> <config>    Update symlink in /etc/network/interfaces.d for
                             <ifname>, to point to config with name <config>.

    show                     Output interfaces config, based on interfaces
                             set at current config.

    save                     Write out the interfaces config to system default
                             location (/etc/network/interfaces).

    reconfigure              Reconfigure the system's network configuration to
                             match the current interfaces file.
