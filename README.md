# XProgressRing

[![Version](https://img.shields.io/cocoapods/v/XProgressRing.svg?style=flat)](http://cocoapods.org/pods/XProgressRing)
[![License](https://img.shields.io/cocoapods/l/XProgressRing.svg?style=flat)](http://cocoapods.org/pods/XProgressRing)
[![Platform](https://img.shields.io/cocoapods/p/XProgressRing.svg?style=flat)](http://cocoapods.org/pods/XProgressRing)
[![](http://img.shields.io/badge/iOS-8.0%2B-blue.svg)]() [![](http://img.shields.io/badge/Swift-3-blue.svg)]() 


A simple customised ProgressView (LoadingView) with three modes.
<br />
It has three modes as shown in the screenshots above : <br />
1-fullModeProgress : just one circle that keeps rotating. <br />
2-halfModeProgress : two circles. <br />
3-quarterModeProgress : four circles. <br />

## Screenshots 
<img src="https://github.com/SubhiH/XprogressRing/blob/master/docs/screenShots/demo1.gif" alt="" width="230" height="200"/>
<img src="https://github.com/SubhiH/XprogressRing/blob/master/docs/screenShots/demo2.gif" alt="" width="240" height="200"/>
<img src="https://github.com/SubhiH/XprogressRing/blob/master/docs/screenShots/demo3.gif" alt="" width="240" height="200"/>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

### CocoaPods

XProgressRing is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "XProgressRing"
```

### Manually
just drag and drop into your project the files:<br/>
1-`KDCircularProgress.swift`.<br/>
2-`XProgressRing.swift`.

## Implementation:
After the installation, you can use it straight with xib/storyboard. <br />
1- Drag and drop View in your xib/storyboard and give constraints you want. It is important to set the same value for width and height. <br />
2-In the inpector set the custome class as "XProgressRing". <br />
<img src="https://github.com/SubhiH/XprogressRing/blob/master/docs/screenShots/s1.png" alt="" width="260" height="200"/>

3-In the attribute inpector tab, set the value for: <br />
    1- Raduis = the raduis for the view. It is important to set this value the same as width and height to get rounded              circle. <br />
    2- Progress speed : the speed of cicling animation. <br />
    3- Progress thickness : the thickness of animated track that keeps cicling. <br />
    4- Progess Color = the color of the progess. <br />
    5- BackgroundColor = the color of the view (the silent part in XProgressRing). <br /> <br />
<img src="https://github.com/SubhiH/XprogressRing/blob/master/docs/screenShots/s2.png" alt="" width="300" height="500"/> <br />

4- In your code and after link the view with @IBOutlet <br />

```swift
@IBOutlet var xProgressRing: XProgressRing!
    override func viewDidLoad() {
        super.viewDidLoad()
        xProgressRing.startAnimation(ProgressMode: ProgressMode.quarterModeProgress);

    }
```
 <br />
In the `startAnimation` you should pass the mode for ProgressView (fullModeProgress,halfModeProgress,quarterModeProgress and the default one is `quarterModeProgress`).
 <br />
-To stop the animation and hide progressView call: `stopAnimation()`.
 <br />
## Important feature:
as you know, when you are showing progressView for the user, you have to stop the user from interacting with the component in below the progressView, so you can call `addSeparableView` to insert separated view to disable ineracting : <br />
```swift
xProgressRing.stopAnimation()
```
<br />

## Dependencies

[KDCircularProgress] (https://github.com/kaandedeoglu/KDCircularProgress):

## License

XProgressRing is available under the MIT license. See the LICENSE file for more info.
