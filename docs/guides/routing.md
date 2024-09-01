Routing is a way to load different components based on the URL. With routing you can create Single Page Applications (SPA) that load elements dynamically. Modern javascript frameworks like Angular, React and Vue have their own routing libraries. Nevertheless, you can also use the following approach to create a simple routing system in vanilla JavaScript.

First, create a `router-view` element in your HTML file. This element will be used as the loading container for different components.

```html
<router-view>
    <!-- Components will be loaded here -->
</router-view>
```

Next, for all links that you want to use for routing, add a `route` attribute without any value. This attribute will be used to identify the links that should trigger the routing.

Now, create a JavaScript file to handle the routing. In this file, we will add a simple event listener to listen for clicks on the links. When a link is clicked, we will prevent the default behavior and load the component based on the `href` attribute of the clicked link.

```javascript
document.addEventListener("DOMContentLoaded", async () => {
    // Save the routes if not already saved
    const links = [...document.querySelectorAll("a[route]")];

    // Add a click event listener to all links
    links.forEach(async (el) => {
        el.onclick = () => route(el, $event);
    });
});

async function route(el) {
    event.preventDefault();

    // Get the URL from the href attribute
    const href = el.getAttribute("href");

    // Update the URL
    console.log("Updating to:", url);
    window.history.pushState({}, "", url);

    // Fetch the content of the URL
    const html = await fetch(href).then((res) => res.text());

    // Load the HTML content into the router-view element
    document.querySelector("router-view").innerHTML = html;
}
```

You can also add a `popstate` event listener to handle the back and forward buttons of the browser.

If you want to use this routing system, you can also check out our [Vanilla Router](https://github.com/kaangiray26/vanilla-router) library, which is a simple and lightweight routing library for vanilla JavaScript.