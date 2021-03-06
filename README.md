<!--
@Author: Maxime JUNGER <junger_m>
@Date:   02-04-2016
@Email:  maximejunger@gmail.com
@Last modified by:   junger_m
@Last modified time: 02-04-2016
-->



# MJSnackBar

<!--[![CI Status](http://img.shields.io/travis/Maxime Junger/MJSnackBar.svg?style=flat)](https://travis-ci.org/Maxime Junger/MJSnackBar)-->
[![Version](https://img.shields.io/cocoapods/v/MJSnackBar.svg?style=flat)](http://cocoapods.org/pods/MJSnackBar)
[![License](https://img.shields.io/cocoapods/l/MJSnackBar.svg?style=flat)](http://cocoapods.org/pods/MJSnackBar)
[![Platform](https://img.shields.io/cocoapods/p/MJSnackBar.svg?style=flat)](http://cocoapods.org/pods/MJSnackBar)

## Author

Maxime Junger, maxime.junger@epitech.eu

## About

MJSnackBar is a pure Swift implementation of the [Android SnackBar](https://www.google.com/design/spec/components/snackbars-toasts.html#snackbars-toasts-usage) which is very useful to display short informations and allow user to perform an action about it. It automatically disappear after a delay that you can set.

![MJSnackBar demo](http://i.imgur.com/kwWNE0Y.gif)

## Installation

#### Pod (Recommended) :
MJSnackBar is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MJSnackBar"
```

#### Manually (Not Recommended) :
You can download the project and add the files manually but it won't be updated


## Example Project

The included example project provides a demonstration of MJSnackBar. It's a UITableView with a little ToDo list. When you delete an item, the MJSnackBar is presented with a button allowing user to undo that action.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Instantiate :

##### Pre-configured way :
```swift
let sb = MJSnackBar()
```

##### Custom properties way :
You can configure some properties of MJSnackBar by passing a dictionary like this :
```swift
var customSnackBar = Dictionary<String, Any>() // Instantiate the dictionary

customSnackBar["spaceOnSide"] = 5.0 // Double - Value for space size on each side
customSnackBar["spaceOnBottom"] = 5.0 // Double - Value for space size on bottom
customSnackBar["snackViewHeight"] = 50.0 // Double - Height of the snack view
customSnackBar["backgroundColor"] = 0x1D1D1D // Int - SNackBar background color
customSnackBar["backgroundAlpha"] = CGFloat(0.8) // CGFloat - SnackBar background alpha
customSnackBar["appearanceDuration"] = 4.0 // Double - Appearance time of the SnackBar
customSnackBar["animationTime"] = 0.3 // Double - Animation duration oh the SnackBar
customSnackBar["leftActionTextColor"] = 0xFFFFFF // Int - Left text color
customSnackBar["actionButtonText"] = "Undo" // String - Text of action button
customSnackBar["actionButtonTextColorNormal"] = 0xFFFFFF // Int - Action button color normal
customSnackBar["actionButtonTextColorSelected"] = 0xDDDDDD // Int - Action button color selected

let sb = MJSnackBar(custom: customSnackBar)
```
All parameters are optionals !

### Displaying

To show the SnackBar, just use the show() method. It comes with a completion handler that let you know if the view disappeared due to the TIMER or if the user canceled it. You have two responses of MJSnackBar.EndShowingType :
- TIMER
- USER

```swift
snackbar.show(self.view, message: "Deleted : " + savedString, completion: {reason in
      // Handle the way the view disappeared nicely
      if (reason == MJSnackBar.EndShowingType.USER) {
        // WTF User canceled it
      }
    })

```

### Dismissing

The MJSnackBar automatically disappear after the time entered in parameters or if the user pressed the action button.
However, you can stop it manually by calling :
```swift
sn.dismiss()
```

## License

MJSnackBar is available under the MIT license. See the LICENSE file for more info.
