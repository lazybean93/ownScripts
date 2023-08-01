VMID="cf094f51-638a-4999-b664-1061157193b9"

if [ -z "$(vboxmanage list runningvms | grep $VMID)" ]; then
	vboxmanage startvm $VMID
else
	vboxmanage controlvm $VMID savestate
fi
