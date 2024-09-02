While using the `positron dev` command, you may notice that the server does not automatically reload the files when you make changes to the templates. This is because we need to change the value of `TEMPLATES_AUTO_RELOAD` config option for the Quart. Here is how you can do it in your `app.py` file:

```python
from quart import Quart, render_template

app = Quart(__name__)
app.config["TEMPLATES_AUTO_RELOAD"] = True

@app.route("/")
async def hello():
    return await render_template("index.html")
```

Now, the server will automatically reload the files when you make changes to the templates.