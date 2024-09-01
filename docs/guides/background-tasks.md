During the lifetime of your application, you may need to perform tasks in the background, where the operation takes a long time to complete. Because these tasks can take a long time to complete, they will block the main thread, which will make your application unresponsive. To avoid this, you can perform these tasks in the background.

Quart provides the method [add_background_task](https://quart.palletsprojects.com/en/latest/how_to_guides/background_tasks.html) to add a background task to the application. This method takes an async function as an argument and schedules it to run in the background.

Here is an example of how to use this method:

```python
from quart import Quart, render_template

app = Quart(__name__)

async def background_task(duration):
    print("Starting background task...")
    await asyncio.sleep(duration)
    print("Background task completed!")

@app.route("/")
async def hello():
    app.add_background_task(
        background_task(duration=5)
    )
    return await render_template("index.html")
```