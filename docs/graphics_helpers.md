# Graphics helpers

These scripts use Image Magick's command line tools to help create graphic resources for iOS and Android.

> Note: These scripts are meant to be used in a Unix-like operating system, such as Mac OS and Linux. The following bash commands are also required: `file`, `awk`. If you want to use them on Windows, you might need to adjust/replace the bash commands.

## Icon resources

These scripts help you create icons for different screen resolutions.

### Android icons

The icon maker for Android requires the following parameters:

1. The source icon image. The image size should be in the range of 256x256 to 512x512 pixels.
2. The destination icon name.
3. A base size, which can be one of the sizes (in `dp` units): 18, 24, 36, 48.

For example, you need a 18dp home icon in your project, you would use the following command:

~~~
$ mkicon-android.sh ic_home.png icon_home 18
~~~

This would create one image for each screen resolution in the current directory:

* `icon_home_18dp_hdpi.png`
* `icon_home_18dp_mdpi.png`
* `icon_home_18dp_xhdpi.png`
* `icon_home_18dp_xxhdpi.png`
* `icon_home_18dp_xxxhdpi.png`

Then, you can import these images to your Android Studio project.

### iOS icons

The icon maker for iOS works very similar and requires the same parameters:

1. The source icon image. The image size should be in the range of 256x256 to 512x512 pixels.
2. The destination icon name.
3. A base size for the icon (in `pt` units).

For example, you want to set the app icon, so you need several image sizes, one of them is the 60pt icon:

~~~
$ mkicon-ios.sh my_app_icon.png app 60
~~~

This would create the following images:

* `app_60pt_1x.png`
* `app_60pt_2x.png`
* `app_60pt_3x.png`

Now, you can drag these images into XCode for the 60pt app icon.

## Image resources

These scripts help you create images for different screen resolutions.

### Android images

The graphic maker for Android requires the following parameters:

1. The source image.- This image should be a high resolution graphic, such as a 2MP image.
2. The destination name.
3. The desired image resolution in pixels.- The image will be adjusted to fit the specified size, preserving the aspect ratio.

For example, if you want an image that is 320x100 pixels, you can use the following command:

~~~
$ mkgraphic-android.sh my_2mp_pic.jpg my_graphic 320x100
~~~

The script would create the following images:

* `my_graphic_320x100dp_hdpi.png`
* `my_graphic_320x100dp_mdpi.png`
* `my_graphic_320x100dp_xhdpi.png`
* `my_graphic_320x100dp_xxhdpi.png`
* `my_graphic_320x100dp_xxxhdpi.png`

Now, you can use the images in your project.

### iOS images

The graphic maker for iOS requires the same parameters as the one for Android and the difference is the result images. Using the same parameters as the one for Android:

~~~
$ mkgraphic-ios.sh my_2mp_pic.jpg my_graphic 320x100
~~~

The script creates the following images:

* `my_graphic_320x100pt_1x.png`
* `my_graphic_320x100pt_2x.png`
* `my_graphic_320x100pt_3x.png`

Now, you can import these images in your project.

