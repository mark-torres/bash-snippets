# Graphics helpers

These scripts use Image Magick's command line tools to help create graphic resources for iOS and Android.

## Icon makers

These scripts help you create icons for different resolutions.

### Android icons

The icon maker for Android requires the following parameters:

1. The source icon image. This image should be in the range of 256x256 to 512x512 pixels.
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

1. The source icon image. This image should be in the range of 256x256 to 512x512 pixels.
2. The destination icon name.
3. A base size for the icon (in `pt` units).

Example