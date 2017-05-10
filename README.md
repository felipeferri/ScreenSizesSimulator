# ScreenSizesSimulator
Use a single iOS device for testing your app in all iPhone sizes

Do you test for different screen sizes when developing your iOS apps? You know you should, right?

Running the same app on different simulators can take too long, and having several devices is inviable for many of us. That's why the Screen Sizes Simulator can be a good idea for you.

Screen Sizes Simulator is a storyboard template and a neat control panel that allow you to run your app on screens mimicking all current iPhone models sizes. See below what I mean. All screenshots were obtained by running the Demo app included in this repo on the iPhone6 simulator.

iPhone6 regular size             |  iPhone5 size on iPhone6
:-------------------------:|:-------------------------:
![](/../screenshots/screenshots/iPhone6.png)  |  ![](/../screenshots/screenshots/iPhone5_panel.png)

iPhone4 size on iPhone6             |  iPhone4 size landscape
:-------------------------:|:-------------------------:
![](/../screenshots/screenshots/iPhone4_panel.png)  |  ![](/../screenshots/screenshots/iPhone4_landscape.png)

If you run the Screen Sizes Simulator on an iPad you can run your app in all iPhone sizes and they will show in the real device size. Maybe you have an iPhone 4S (my case ugh) and you want to see how the layout for the iPhone6 runs on a phone. Then you can use the "fit" option in the panel to zoom out the app until if fits on your phone screen, maintaining all the UI elements proportions.

***
## Installing Screen Sizes Simulator on your app
Please check the demo project if you are in doubt.

1. Copy the "Screen Sizes" folder into your project.
2. Locate your Initial View Controller on your project storyboard and set its Storyboard ID as "SwipeViewController" on the Identity Inspector.
3. Open the SizesSimulator storyboard and make sure the Storyboard reference block is pointing to your Main storyboard (unless you changed your main storyboard name the default value should suffice).
4. Open your project target on the General tab and set Main Interface as "SizesSimulator".
5. Run your project on a device or the simulator and everything should work.

You must remember to change your Main Interface back to your main storyboard when releasing your app to the AppStore. If you feel bold, you can create a new target specifically for the Screen Sizes Simulator instead of changing your main target Main Interface. Check the demo app for an example.

## Using the Screen Sizes Simulator
The Screen Sizes Simulator has a small control panel on top. If you tap on it it will disappear; if you shake your phone it will appear again.

You can select four different iPhone sizes: iPhone4S, iPhone5/SE, iPhone6S/7S, iPhone6S+/7S+.

You can also select four zoom levels: 1x, 2x, fit and fill.

* 1x shows the normal screen size. You should use this when running the app on a device larger than the screen you want to show (for example, running the iPhone5S screen on an iPhone6S).
* 2x shows double the screen size. This actually is only useful if you're running your app on an iPad. It is similar to the zoom option available when you run an iPhone (non-universal) app on iPad.
* fit will apply a zoom level that fits the app on the current phone screen. This is the ideal to use when displaying larger screens than your iPhone. For example, for showing the iPhone6S size on an iPhone4S device.
* fill will apply a zoom level that fills the phone screen with the selected display size.

## To do (pull requests are welcome)
* Create a podfile
* Make a coded version of the Simulator wich doesn't require messing around with targets and info.plists
* If you use size classes the simulator will not respond correctly when running on an iPad becase the size classes for height and width of the iPad even when on landscape are not the same that for an iPhone. I don't know how to solve this.
