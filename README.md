# ToastProvider

## Providing your app with Toast messages.  
A simple Toast provider library, to provide your app with some temporary information in an eye pleasing fashion.

It can show a title, an optional subtitle, and also an optional image. 

Configure the size and the display time of the toast, by changing the values of the configuration and passing this into showToast i.e:

```
let configuration = ToastConfiguration()
configuration.displayTime = 1.5
```

There are also a few different options for animation types. If you would like to see something added, suggestions are welcomed!

<p align="center">
<img src="https://github.com/wevat/ToastProvider/blob/master/ToastProvider/Assets/toast.gif" width="400">
</p>


[![CI Status](https://img.shields.io/travis/harryblam/ToastProvider.svg?style=flat)](https://travis-ci.org/harryblam/ToastProvider)
[![Version](https://img.shields.io/cocoapods/v/ToastProvider.svg?style=flat)](https://cocoapods.org/pods/ToastProvider)
[![License](https://img.shields.io/cocoapods/l/ToastProvider.svg?style=flat)](https://cocoapods.org/pods/ToastProvider)
[![Platform](https://img.shields.io/cocoapods/p/ToastProvider.svg?style=flat)](https://cocoapods.org/pods/ToastProvider)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ToastProvider is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ToastProvider'
```

## Author

harryblam, harry@wevat.com

## License

ToastProvider is available under the MIT license. See the LICENSE file for more info.
