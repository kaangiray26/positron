By default, Flatpak applications do not have access to the network. We keep this default to ensure that the application does not mess with other services running on localhost with the same port. However, you can of course enable network access for your Flatpak applications. All you need to do is to add the `--share=network` argument to the `manifest.yml` file. Here is an example:

```yaml
id: org.flatpak.positron
runtime: org.freedesktop.Platform
runtime-version: "23.08"
sdk: org.freedesktop.Sdk
command: org.flatpak.positron.sh
finish-args:
    - --share=ipc
    - --device=dri
    - --socket=wayland
    - --socket=fallback-x11
    - --filesystem=~/.var/app/org.flatpak.positron/data/
    - --share=network
...
```

Now, rebuild the Flatpak application for the changes to take effect.