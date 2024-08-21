# Iris

In order to get the iris keyboard to work with [via](https://usevia.app)
the following steps are required:

## Enable Udev rules

```sh
set -x USER_GID (id -g)
sudo --preserve-env=USER_GID fish -c 'echo "KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{serial}==\"*vial:f64c2b3c*\", MODE=\"0660\", GROUP=\"$USER_GID\", TAG+=\"uaccess\", TAG+=\"udev-acl\"" > /etc/udev/rules.d/99-vial.rules && udevadm control --reload && udevadm trigger'
```

## Reload rules

```sh

sudo udevadm control --reload-rules && sudo udevadm trigger
```
