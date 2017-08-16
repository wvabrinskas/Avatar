
<img width="100" src="./public/avatar.png">

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
* Get a random user avatar and the seed by running

        Avatar.generate(for: avatar.frame.size, scale: 20) { (seed, avatarImage) in

        }
        
* `AvatarSeed` has the available properties:
  * `scale: Int` - resolution of each square of the image
  * `map: [Int]` - the layout map of the colors represented by an `Int` from 0 to 2
  * `size: CGSize` - size of the overall image
  * `colors: Colors` - tuple that contains the primary, secondary, and tertiary colors of the image.
  * Can be created by calling: `let seed = AvatarSeed(map: map, colors: colors, size: size, scale: scale)`
