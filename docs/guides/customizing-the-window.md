Customization of the windows is done by making changes to the Firefox profile. Find the `profile` folder in your Positron installation directory. Inside the `profile/chrome` folder you will find a file called `userChrome.css`. This file is used to customize the appearance of the browser window. You can change the appearance of the browser window by adding CSS rules to this file.

To see what you can change in the browser window, you can use the browser's built-in developer tools. First, open the browser and press `Ctrl+Shift+I` to open the developer tools. Then click on the settings icon in the top right corner.

![Developer Tools Settings](/positron/assets/devtools-settings.png)

In the settings, check the following options under the **Advanced settings** section:

- **Enable browser chrome and add-on debugging toolboxes**
- **Enable remote debugging**

![Advanced Settings](/positron/assets/advanced-settings.png)

After enabling these options, press `Ctrl+Alt+Shift+I` to open the browser toolbox. This will open the **Browser Toolbox** window, which allows you to inspect and modify the browser window. From here, fiddle with the elements from the browser window to see what you can change.

![Browser Toolbox](/positron/assets/browser-toolbox.png)

Once you find things you want to change, add the corresponding CSS rules to the `userChrome.css` file. The changes will take effect the next time you build and run Positron.