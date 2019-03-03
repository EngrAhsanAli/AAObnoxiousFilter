# Table of Contents

- [AAObnoxiousFilter](#section-id-4)
- [Description](#section-id-10)
- [Demonstration](#section-id-16)
- [Requirements](#section-id-26)
- [Installation](#section-id-32)
- [CocoaPods](#section-id-37)
- [Carthage](#section-id-63)
- [Manual Installation](#section-id-82)
- [Getting Started](#section-id-87)
- [Contributions & License](#section-id-156)


<div id='section-id-4'/>

#AAObnoxiousFilter

[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/AAObnoxiousFilter.svg)](http://cocoadocs.org/docsets/AAObnoxiousFilter) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/EngrAhsanAli/AAObnoxiousFilter.svg?branch=master)](https://travis-ci.org/EngrAhsanAli/AAObnoxiousFilter) 
![License MIT](https://img.shields.io/github/license/mashape/apistatus.svg) [![CocoaPods](https://img.shields.io/cocoapods/p/AAObnoxiousFilter.svg)]()
![AA-Creations](https://img.shields.io/badge/AA-Creations-green.svg)
![Country](https://img.shields.io/badge/Made%20with%20%E2%9D%A4-pakistan-green.svg)

<div id='section-id-10'/>

##Description


AAObnoxiousFilter is a profanity filter for images written in CoreML and Swift. Its a lightweight framework that can detect the inappropriation in UIImage with a single line of code.


<div id='section-id-16'/>

##Demonstration



![](https://github.com/EngrAhsanAli/AAObnoxiousFilter/blob/master/Screenshots/demo.gif)


To run the example project, clone the repo, and run `pod install` from the Example directory first.


<div id='section-id-26'/>

##Requirements

- iOS 11.0+
- Xcode 10.0+
- Swift 4.2+

<div id='section-id-32'/>

# Installation

`AAObnoxiousFilter` can be installed using CocoaPods, Carthage, or manually.


<div id='section-id-37'/>

##CocoaPods

`AAObnoxiousFilter` is available through [CocoaPods](http://cocoapods.org). To install CocoaPods, run:

`$ gem install cocoapods`

Then create a Podfile with the following contents:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target '<Your Target Name>' do
pod 'AAObnoxiousFilter'
end

```

Finally, run the following command to install it:
```
$ pod install
```



<div id='section-id-63'/>

##Carthage

To install Carthage, run (using Homebrew):
```
$ brew update
$ brew install carthage
```
Then add the following line to your Cartfile:

```
github "EngrAhsanAli/AAObnoxiousFilter" "master"
```

Then import the library in all files where you use it:
```swift
import AAObnoxiousFilter
```


<div id='section-id-82'/>

##Manual Installation

If you prefer not to use either of the above mentioned dependency managers, you can integrate `AAObnoxiousFilter` into your project manually by adding the files contained in the Classes folder to your project.


<div id='section-id-87'/>

#Getting Started
----------

<div id='section-id-90'/>

##Detect the Image

```swift
if let prediction = image.predictImage() {
    // prediction if greater than 0.5, the image will have inappropriate look
}
else {
    // Exception in any other case if the Image is not valid to predict
}
```

<div id='section-id-156'/>

#Contributions & License

`AAObnoxiousFilter` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

Pull requests are welcome! The best contributions will consist of substitutions or configurations for classes/methods known to block the main thread during a typical app lifecycle.

I would love to know if you are using `AAObnoxiousFilter` in your app, send an email to [Engr. Ahsan Ali](mailto:hafiz.m.ahsan.ali@gmail.com)
