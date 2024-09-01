Positron comes with a command line interface (CLI) tool to help you develop and build your applications. The tool can be installed from the Python Package Index (PyPI) using the following command:

```bash
pip install positronpy
```

Notice that the tool is named `positronpy` instead of `positron`. This is because the name `positron` was already taken on PyPI.

After installing it, the tool can be invoked using the `positron` command. To see the available commands, run the following command:

```bash
positron --help
```

The CLI tool provides the following commands:

- `dev`: Starts a development server that automatically reloads the application when changes are made to the source code. The server runs on `http://127.0.0.1:8000` by default.
- `build`: Builds and runs the application using the manifest file.

Use these commands as follows:

```bash
positron <command>
```

You can check out the source code on [GitHub](https://github.com/kaangiray26/positronpy).