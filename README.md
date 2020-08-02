# iOS-FitFill
> Implement editing a picture's aspect ratio and size, incluing `Fit in` and `Fill in` features.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

## Demo

<a href="https://imgflip.com/gif/4a7vqa"><img src="https://i.imgflip.com/4a7vqa.gif" title="made at imgflip.com"/></a>

## Requirements

- iOS 12.0+

## Installation

#### Run `git clone` in Terminal

```
git clone https://github.com/HsiaoAi/iOS-FitFill.git
```

#### Build the Project on Simulators or Real Devices

## Usage example

```swift
let targetSize = CGSize(width: 300, height: 400)
let scaleMode = UIImage.ScaleMode.fit
let resizedImage = originalImage.resizeImage(to: targetSize, with: scaleMode)
```

## Meta

IFang Lee – [LinkedIn](https://www.linkedin.com/in/ifang-lee-1b29a362/) – ilct227@gmail.com

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
