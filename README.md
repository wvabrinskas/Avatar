# Avatar
Generate random user Avatars for apps.

Works for iOS 10+

![](https://github.com/wvabrinskas/Avatar/blob/master/public/Avatar.gif)

# Installation
* Simply install using Cocoapods, add `'pod Avatar'` to your podfile

# Simple to use
* `import Avatar`
* Get a random user avatar by running `let avatar = Avatar.generate(for: avatar.frame.size, scale: 20)`
  * `avatar.frame.size` is the size of your UIImageView for the avatar
  * `scale` is the pixel size of each color generated, aka. the resolution
