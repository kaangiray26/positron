![Supported operating systems](/positron/assets/linux.png)

Because Flatpak is only available on Linux systems, it is only possible to install Positron on Linux. Use the following command to install it on your system:

```bash
curl -fsSL https://kaangiray26.github.io/positron/install.sh | sh
```

[View script source](https://github.com/kaangiray26/positron/blob/main/docs/install.sh)

If you're done with the installation, you should now see some files and directories inside your project folder. To learn more about them, check the [structure](structure.md) page.

## Building your first application

After following this guide, you will have a simple application that shows a simple message.

### Step 1: Installation
We will start by installing Positron. If you haven't installed it yet, go to your project folder and run the following command:

```bash
curl -fsSL https://kaangiray26.github.io/positron/install.sh | sh
```

This will download all the necessary files as a template for your project. Also, it comes with a command-line tool that you can use to quickly start the development server and build your application. To see it, run the following command:

```bash
env/bin/positron --help
```

### Step 2: Web server
First, let's take a look at the `app.py` file, which contains the routes and the logic of our application. Open the file in your favorite text editor and you'll see the following code:

```python
#-*- coding: utf-8 -*-

from quart import Quart, render_template

app = Quart(__name__)

@app.route("/")
async def hello():
    return await render_template("index.html")
```

If you are not familiar with Quart or Flask, this code may look unfamiliar to you with those decorators and async functions. But don't worry.

`app = Quart(__name__)` creates a new Quart application. `@app.route("/")` is a decorator that tells the application to call the `hello` function when the user visits the root URL. `return await render_template("index.html")` tells the application to render the `index.html` template from the `templates` directory.

Now, let's see that `index.html` file now. Open the `templates/index.html` file in your text editor and you'll see the following code:

```html
<!doctype html>
<html lang="en">
    <head>
        <title>Positron</title>
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=5"
        />
        <meta name="description" content="Build desktop apps with Python" />
        <link rel="stylesheet" href="/static/style.css" />
        <link
            rel="shortcut icon"
            type="image/svg+xml"
            href="/static/favicon.svg"
        />
    </head>
    <body>
        <header>
            <img src="/static/favicon.svg" />
            <h1>Positron</h1>
        </header>
        <main>
            <section>
                <h2>Hey there!</h2>
                <p>
                    I'm working just fine. Why are you still waiting? Let's
                    build something great!
                </p>
            </section>
        </main>
    </body>
</html>
```

This is just a simple HTML file. It may seem like a lot of code for a single page, but it's just a starting point. Since Quart uses Jinja2 as the template engine, you can use variables, loops, and conditions in your HTML templates. You can also include other templates, extend them, and more. This allows us to create component-like structures in our templates and reuse them across multiple pages, just like in a modern frontend framework.

You can read more about Jinja2 in the [official documentation](https://jinja.palletsprojects.com/).

### Step 3: Configuring the application
Now that we have our simple application, we can build it. For this, we need to configure some files, especially the `manifest.yml` file. This file contains the necessary information for building the application. Open up the `manifest.yml` file in your text editor and you'll see the following code:

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
modules:
    - name: python
      buildsystem: simple
      build-commands:
          - mkdir -p /app/wheels
          - cp wheels/*.whl /app/wheels/
          - cp app.py /app/
          - cp -r static /app/
          - cp -r templates /app/
          - pip3 install --prefix=/app wheels/*.whl
      sources:
          - type: dir
            path: .

    - name: firefox
      buildsystem: simple
      build-commands:
          # Copy the tarball to the build directory
          - cp firefox.tar.bz2 /app/
          - tar -xf /app/firefox.tar.bz2 -C /app/
          - rm /app/firefox.tar.bz2
          # Copy the profile
          - cp -r profile /app/
      sources:
          - type: dir
            path: .

    - name: positron
      buildsystem: simple
      build-commands:
          - install -Dm755 ${FLATPAK_ID}.sh -t /app/bin
          - install -Dm755 ${FLATPAK_ID}.desktop -t /app/share/applications
          - install -Dm644 favicon.svg /app/share/icons/hicolor/scalable/apps/org.flatpak.positron.svg
          - install -Dm644 16.png /app/share/icons/hicolor/16x16/apps/org.flatpak.positron.png
          - install -Dm644 32.png /app/share/icons/hicolor/32x32/apps/org.flatpak.positron.png
          - install -Dm644 48.png /app/share/icons/hicolor/48x48/apps/org.flatpak.positron.png
          - install -Dm644 64.png /app/share/icons/hicolor/64x64/apps/org.flatpak.positron.png
          - install -Dm644 128.png /app/share/icons/hicolor/128x128/apps/org.flatpak.positron.png
          - install -Dm644 256.png /app/share/icons/hicolor/256x256/apps/org.flatpak.positron.png
          - install -Dm644 512.png /app/share/icons/hicolor/512x512/apps/org.flatpak.positron.png
      sources:
          - type: file
            path: org.flatpak.positron.sh
          - type: file
            path: org.flatpak.positron.desktop
          - type: dir
            path: icons
```

If you're not familiar with Flatpak, please take a look at the [official documentation](https://docs.flatpak.org/en/latest/) to understand how it works. Also, check out the [Flatpak manifest documentation](https://docs.flatpak.org/en/latest/manifests.html) to understand the structure of the `manifest.yml` file.

Here, we use the `org.freedesktop.Platform` runtime. This runtime is provided by the Flatpak project and contains the necessary libraries and dependencies for running applications. If you look at the `finish-args` section, you'll see some permissions that we set for the application. You may notice that we don't have any permissions for the `network` in this file. This is because we will be serving our application as a local web server at the address `http://127.0.0.1:8000` and don't want to expose it to the user's network, so that we mess with other applications or services running on the user's machine.

In the `modules` section, we have three modules: `python`, `firefox`, and `positron`.

The `python` module contains the Python application we built earlier

The `firefox` module contains the binaries for the Firefox browser. We will use Firefox to render the HTML content of our application.

The `positron` module contains the necessary files for running the application, such as the shell script, the desktop file, and the icons.

Take a look at other files in the `positron` directory to understand how they work. A detailed explanation of each file is provided in this documentation.

### Step 4: Building the application
For building the application, we can just use our `positron` CLI tool. Run the following command in your terminal:

```bash
env/bin/positron build
```

This command will build the flatpak and run it if the build is successful. You should see the window open up with the application running. Closing the window will cause the application to stop running and exit.

**Congratulations!**  You have successfully built your first Flatpak application using Positron. Check out the other sections of this documentation to learn more about the features of Positron and how to use them.