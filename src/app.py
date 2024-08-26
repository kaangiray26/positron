#-*- coding: utf-8 -*-

from quart import Quart, render_template

app = Quart(__name__)

@app.route("/")
async def hello():
    return await render_template("index.html")