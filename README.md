# XProgressRing

[![Version](https://img.shields.io/cocoapods/v/XProgressRing.svg?style=flat)](http://cocoapods.org/pods/XProgressRing)
[![License](https://img.shields.io/cocoapods/l/XProgressRing.svg?style=flat)](http://cocoapods.org/pods/XProgressRing)
[![Platform](https://img.shields.io/cocoapods/p/XProgressRing.svg?style=flat)](http://cocoapods.org/pods/XProgressRing)
[![](http://img.shields.io/badge/iOS-8.0%2B-blue.svg)]() [![](http://img.shields.io/badge/Swift-3-blue.svg)]() 
[![](http://img.shields.io/badge/Swift-4-blue.svg)]() 


A simple customised ProgressView (LoadingView).
<br />
It has three modes ;shown in the screenshots below : <br />
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

## Implementation
After the installation, you can use it straight forward with xib/storyboard. <br />
1-Drag and Drop View in your xib/storyboard and give constraints that you want . It is important to set the same value for width and height. <br />
2-In the inpector set the custome class as "XProgressRing". <br />
<img src="https://github.com/SubhiH/XprogressRing/blob/master/docs/screenShots/s1.png" alt="" width="260" height="200"/>

3-In the attribute inpector tab, set the value for: <br />
<ul>
  <li>Raduis : raduis for the view. It is important to set this value the same as width and height to get rounded circle.</li>
  <li>Progress speed : the speed of cycling animation.</li>
  <li>Progress thickness : the thickness of animated track that keeps cycling.</li>
  <li>Progess Color : the color of the progess.</li>
  <li>BackgroundColor : the color of the view (the silent part in XProgressRing).</li>
</ul>
<img src="https://github.com/SubhiH/XprogressRing/blob/master/docs/screenShots/s2.png" alt="" width="300" height="500"/> <br />

4- After linking the view with @IBOutlet, you should call the following methodth @IBOutlet <br />

```swift
@IBOutlet var xProgressRing: XProgressRing!
    override func viewDidLoad() {
        super.viewDidLoad()
        xProgressRing.startAnimation(ProgressMode: ProgressMode.quarterModeProgress);

    }
```
 <br />
In the `startAnimation` you should pass the mode for ProgressView (fullModeProgress ,halfModeProgress ,quarterModeProgress and the default one is `quarterModeProgress`).
 <br />
To stop the animation and hide progressView call: `stopAnimation()`.
 <br />
## Important feature
When the progressView is Displayed for the user; the interaction between the user and the components below the progressView should be forbidden, to implement this action, `addSeparableView` method can be invoked.<br />

```swift
xProgressRing.stopAnimation()
```
<br />

## Dependencies

<a href="https://github.com/kaandedeoglu/KDCircularProgress">KDCircularProgress</a>

## License

XProgressRing is available under the MIT license. See the <a href="https://github.com/SubhiH/XprogressRing/blob/master/LICENSE">LICENSE file</a>  for more info.
