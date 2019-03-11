# novoda-constraints

Novoda Constraints is a lightweight, pure-Swift library designed to assist developers in setting up and creating constraints programmatically.

## Features

- [x] Align multiple views by specified edges
- [x] Stack multiple views with direction + spacing
- [x] Set size via constants / size equal to view
- [x] Pin views to eachother
- [x] Pin views to superview / safe area
- [x] Optionally set constraint attributes such as priority, inset and relation type

## Align

Writing constraints using the default iOS constraints can be cumbersome and lead to large copy and pasted code. Here is an example of aligning two views using iOS constraints:

```swift
let leadingAlign = NSLayoutConstraint(item: view,
                                      attribute: .leading,
                                      relatedBy: .equal,
                                      toItem: otherView,
                                      attribute: .leading,
                                      multiplier: 1,
                                      constant: 0)

let trailingAlign = NSLayoutConstraint(item: view,
                                       attribute: .trailing,
                                       relatedBy: .equal,
                                       toItem: otherView,
                                       attribute: .trailing,
                                       multiplier: 1,
                                       constant: 0)

view.addConstraint(leadingAlign)
view.addConstraint(trailing)
```


And here is an example of aligning two views using Novoda Constraints:

```swift
view.align(.leading, .trailing,
           with: otherView)
```

You can optionally add extra parameters to most of the functions available in this library such as:

```swift
view.align(.leading, .trailing,
           with: otherView,
           constant: 0,
           priority: .required,
           relatedBy: .equal)
```

If you want to align multiple views you can do this in one line!

```swift
viewArray.align(edges: .leading, .trailing)
```

## Stack

You can also stack views in combination with the above to quickly create entire screens:

```swift
viewArray.stack(direction: .vertical,
                spacing: 30, 8)
```
> There are full details on how the `spacing` parameter works on the function docs in the library itself.

> In short; the spacing parameter takes any number of spacings and applies these spacings to the views, the last spacing provided will be used for any subsequent views. E.g. provided a single spacing of 8 will apply 8 spacing to every view in the array.

## Pin

You can pin a view to its superview, its superview safe area, its center axis or to another view

```swift
view.pin(toSuperview: .leading, .trailing, insetBy: 30)
view.pin(toSuperview: Edge.all)

view.pin(toSuperviewSafeArea: .leading, .trailing, insetBy: 30)
view.pin(toSuperviewSafeArea: Anchor.all)

view.pin(centerXTo: otherView)
view.pin(centerYTo: otherView)
view.pin(centerTo: otherView)

view.pin(.top, to: .bottom, of: otherView)
```
> Note how when pinning to superview we use Edge.all and for superview safe area we use Anchor.all. This is due to the fact that the safe area layout guide uses anchors instead of constraint attributes.

## Set

You can set the size constraints of a view using direct values or by setting it equal to another view

```swift
view.set(height: 30)
view.set(width: 100)

view.set(size: CGSize(width: 100,
                      height: 30))
                                   
view.set(heightEqualTo: otherView)
view.set(widthEqualTo: otherView)
view.set(sizeEqualTo: otherView)
```

As you can see, the usage is much shorter and cleaner, allowing you to focus on the important things.


## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 9.0+
Swift 4.0+

## Installation

novoda-constraints is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'novoda-constraints'
```

## Author

Novoda iOS Team

## License

novoda-constraints is available under the Apache license. See the LICENSE file for more info.
