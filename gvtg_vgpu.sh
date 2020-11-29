#!/usr/bin/env sh

# Workaround to deal with the problem that the system cannot suspend if gvtg_vgpu is on
# Remove gvtg_vgpu before suspend or hibernation
# Recreate gvtg_vgpu after waking from suspend or hibernation

# Do nothing, if the service is disabled
if ! systemctl is-enabled gvtg_vgpu.service &> /dev/null; then
    exit 0
fi

case $1 in
    pre)
	/usr/bin/systemctl stop gvtg_vgpu.service
	;;
    post)
	/usr/bin/systemctl start gvtg_vgpu.service
	;;
esac
