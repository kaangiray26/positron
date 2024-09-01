Sometimes you want to do couple of things before the application starts. For example, you might read some configuration from a file, or you might want to connect to a database. In this case, you can use the [before_serving](https://quart.palletsprojects.com/en/latest/reference/source/quart.app.html#quart.app.Quart.before_serving) decorator in Quart to run a function before the application starts serving requests. Here is an example:

```python
from quart import Quart, render_template

app = Quart(__name__)

@app.before_serving
async def startup():
    print("Starting up...")
    print("beep boop beep")
    print("Ready to serve requests!")

@app.route("/")
async def hello():
    return await render_template("index.html")
```