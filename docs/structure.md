After you run the Positron installation script, (hopefully) you'll find some files and directories in your project folder.

env/
: This is a virtual environment that contains all the necessary dependencies for your application. You can activate it by running `source env/bin/activate` on Unix-like systems or `env\Scripts\activate` on Windows.

[icons/](https://github.com/kaangiray26/positron/tree/main/src/icons)
: This is where you can put your icons in different sizes to be used as the Flatpak application icon.

[profile/](https://github.com/kaangiray26/positron/tree/main/src/profile)
: This one is a Firefox profile, configured to make your application look like a desktop application. You can customize it using CSS as you wish.

[static/](https://github.com/kaangiray26/positron/tree/main/src/static)
: Quart serves static files from this folder. You can put everything here, even your Python scripts if that makes sense for you.

[templates/](https://github.com/kaangiray26/positron/tree/main/src/templates)
: This is where you can put your HTML templates. Jinja2 is used to render them, so you can use all its features.

wheels/
: This is where the wheel package is stored after running the build script. It is used to create the Flatpak application for the correct Python version.

[app.py](https://github.com/kaangiray26/positron/blob/main/src/app.py)
: This is the main Python script that the web server runs. You can put your main logic and routes here.

[Dockerfile](https://github.com/kaangiray26/positron/blob/main/src/Dockerfile)
: This Dockerfile gathers necessary dependencies with the correct Python version that is supported by the org.freedesktop.Platform runtime on Flatpak. It builds a wheel package and creates an archive that can be used in the build process.

[manifest.yml](https://github.com/kaangiray26/positron/blob/main/src/manifest.yml)
: This is the manifest file that Flatpak-builder uses to build the application. You can customize it as you wish.

[org.flatpak.positron.desktop](https://github.com/kaangiray26/positron/blob/main/src/org.flatpak.positron.desktop)
: This is the desktop file that Flatpak uses to create the application shortcut. You can customize it as you wish.

[org.flatpak.positron.sh](https://github.com/kaangiray26/positron/blob/main/src/org.flatpak.positron.sh)
: This is the script that Flatpak uses to run the application. You can customize it as you wish.

[requirements.txt](https://github.com/kaangiray26/positron/blob/main/src/requirements.txt)
: This is where you can put your Python dependencies. The installation script will install them for you.