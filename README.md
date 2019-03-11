# novoda-constraints

Novoda Constraints is a lightweight, pure-Swift library designed to assist developers in setting up and creating constraints programmatically.

## Features

- [x] Align multiple views by specified edges
- [x] Stack multiple views with direction + spacing
- [x] Set size via constants / size equal to view
- [x] Pin views to eachother
- [x] Pin views to superview / safe area
- [x] Optionally set constraint attributes such as priority, inset and relation type

## Example Usage

Writing constraints using the default iOS constraints can be cumbersome and lead to large copy and pasted code. Here is an example of aligning two views using iOS constraints:

```swift
let leadingAlign = NSLayoutConstraint(item: usernameTextField,
                                      attribute: .leading,
                                      relatedBy: .equal,
                                      toItem: passwordTextField,
                                      attribute: .leading,
                                      multiplier: 1,
                                      constant: 0)

let trailingAlign = NSLayoutConstraint(item: usernameTextField,
                                       attribute: .trailing,
                                       relatedBy: .equal,
                                       toItem: passwordTextField,
                                       attribute: .trailing,
                                       multiplier: 1,
                                       constant: 0)

usernameTextField.addConstraint(leadingAlign)
usernameTextField.addConstraint(trailing)
```


And here is an example of aligning two views using Novoda Constraints, optionally adding extra parameters:

```swift
usernameTextField.align(.leading, .trailing,
                        with: passwordTextField)

usernameTextField.align(.leading, .trailing,
                        with: passwordTextField,
                        constant: 0,
                        priority: .required,
                        relatedBy: .equal)
```


If you want to align multiple views you can do this in one line!

```swift
viewArray.align(edges: .leading, .trailing)

viewArray.align(edges: .leading, .trailing,
                constant: 0,
                priority: .required,
                relatedBy: .equal)
```


You can also stack views in combination with the above to quickly create entire screens:

```swift
viewsArray.stack(direction: .vertical,
                 spacing: 30, 8)
```
> There are full details on how the `spacing` parameter works in the wiki cheat sheet or on the func docs in the library itself.


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
