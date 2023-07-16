# Anim

**Anim** is a library that provides a convenient way to use animations in UIKit and create custom animations.

[Document](https://gsm-msg.github.io/Anim/documentation/anim)

## Contents
- [Anim](#anim)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Communication](#communication)
  - [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [Manually](#manually)
  - [Features](#features)
  - [Usage](#usage)
    - [Quick Start](#quick-start)
    - [APIs](#apis)
      - [FadeOut](#fadeout)
      - [FadeIn](#fadein)
      - [Flash](#flash)
      - [Opacity](#opacity)
      - [Shake](#shake)
      - [Rotate](#rotate)
      - [MoveFrom](#movefrom)
      - [Scale](#scale)
      - [Sleep](#sleep)
      - [Identity](#identity)
      - [Serial](#serial)
      - [Concurrent](#concurrent)
      - [Custom Anim](#custom-anim)


## Requirements
- iOS 11.0+ / tvOS 11.0+ / macOS 10.13+ / watchOS 7.0+
- Swift 5.0+

## Communication
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.

## Installation
### Swift Package Manager
[Swift Package Manager](https://www.swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `Anim` into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/GSM-MSG/Anim.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually
If you prefer not to use either of the aforementioned dependency managers, you can integrate Miniature into your project manually.

## Features

https://github.com/GSM-MSG/Miniature/assets/74440939/730bfa73-b9b9-45ca-8c68-97f7f8929c47

## Usage
### Quick Start
```swift
import Anim
import UIKit

final class ViewController: UIViewController {
  @IBOutlet weak var targetView: UIView!

  @IBAction func fadeOutButtonDidTap(_ sender: Any) {
    targetView.anim(anim: .fadeOut())
  }

  @IBAction func shake(_ sender: Any) {
    targetView.anim(anim: .shake())
  }
}
```

### APIs
- `Anim` Protocol

The Anim protocol defines a contract for animations. It includes a single method animate(view:completion:), which is responsible for performing the animation on a given view.

#### FadeOut
Change the alpha value of the View to 0.
```swift
view.anim(anim: FadeOutAnim())
view.anim(anim: .fadeOut())
```

#### FadeIn
Change the alpha value of the View to 1.

```swift
view.anim(anim: FadeInAnim())
view.anim(anim: .fadeIn())
```

#### Flash
Change the alpha value of the View to 0 and 1.

```swift
view.anim(anim: FlashAnim())
view.anim(anim: .flash())
```

#### Opacity
Change the alpha value of the View to argument value.

```swift
view.anim(anim: OpacityAnim(opacity: 0.5))
view.anim(anim: .opacity(opacity: 0.5))
```

#### Shake
Shake the View.

```swift
view.anim(anim: ShakeAnim())
view.anim(anim: .shake())
```

#### Rotate
Rotate the View.

```swift
view.anim(anim: RotateAnim(angle: 1.3))
view.anim(anim: .rotate(angle: 1.3))
view.anim(anim: .rotate(angle: 1.3, reversed: true))
```

#### MoveFrom
Moves the View in the direction of the argument by the argument offset value.

```swift
view.anim(anim: MoveFromAnim(direction: .top, offset: 100))
view.anim(anim: .moveFrom(direction: .top, offset: 100))
view.anim(anim: .moveFrom(direction: .top, offset: 100, reversed: true))

view.anim(anim: .moveFromTop(offset: 100))
view.anim(anim: .moveFromLeft(offset: 100))
view.anim(anim: .moveFromBottom(offset: 100))
view.anim(anim: .moveFromRight(offset: 100))
```

#### Scale
Scales the View by the argument value.

```swift
view.anim(anim: ScaleAnim())
view.anim(anim: .scale(scale: 1.5))
view.anim(anim: .scale(scale: 1.5, reversed: true))
```

#### Sleep
Sleeps the View for the argument value.

```swift
view.anim(anim: SleepAnim())
view.anim(anim: .sleep(1.0))
```

#### Identity
Identity the View.

```swift
view.anim(anim: IdentityAnim())
view.anim(anim: .identity())
```

#### Serial
Serially executes the argument Animations.

```swift
view.anim(anim: SerialAnim(animations: [.fadeOut(), .sleep(1.0), .fadeIn()]))
view.anim(anim: .serial([.fadeOut(), .sleep(1.0), .fadeIn()]))
```

#### Concurrent
Concurrently executes the argument Animations.

```swift
view.anim(anim: ConcurrentAnim(animations: [.fadeOut(), .sleep(1.0), .fadeIn()]))
view.anim(anim: .concurrent([.fadeOut(), .sleep(1.0), .fadeIn()]))
```

#### Custom Anim
You can create a custom Anim by implementing the Anim protocol.

```swift
struct CustomAnim: Anim {
  func animate(view: UIView, completion: @escaping () -> Void) {
    // Animation code
    completion()
  }
}

extension Anim where Self == CustomAnim {
  static func custom() -> CustomAnim {
    return CustomAnim()
  }
}

view.anim(anim: CustomAnim())
view.anim(anim: .custom())
```

You can create custom CAAnimation by TransactionAnim execute.

```swift
struct CustomAnim: Anim {
  func animate(view: UIView, completion: @escaping () -> Void) {
    view.anim(anim: TransactionAnim {
      // implemantation CAAnimation
      return caanimation
    })
  }
}
```