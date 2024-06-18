
install instructions

step 1: package `/nix/store/<hash>-virtio-win-[version]` directory as an ISO.
step 2: follow https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm

step 3: add the following xml:

 and in the libvirt XML you need to add

```xml
    <loader readonly="yes" secure="yes" type="pflash">/etc/ovmf/edk2-x86_64-secure-code.fd</loader>
    <nvram template="/etc/ovmf/edk2-i386-vars.fd"/>
```

to the `<os>`section and

```xml
    <smm state="on"/>
```

to the `<features>` section. 

thank you deleted user on reddit 2 years ago
