//
//  Avatar.swift
//  Avatar
//
//  Created by William Vabrinskas on 6/13/17.
//  Copyright © 2017 williamvabrinskas. All rights reserved.
//

import Foundation
import CoreGraphics
import CoreImage
import UIKit

typealias Colors = (primary: UIColor, secondary: UIColor, tertiary: UIColor)

open class Avatar {
    
    private class func getRandomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue =  CGFloat(arc4random_uniform(256)) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private class func colors() -> Colors {
        let colors:Colors = (primary: getRandomColor(), secondary: getRandomColor(), tertiary: getRandomColor())
        return colors
    }
    
    private class func getImageMap(length: Int) -> [Int] {
        var map = [Int]()
        
        for _ in 0..<length {
            map.append(Int(arc4random_uniform(3)))
        }
        
        return map
    }
    
    public static var customSeed:AvatarSeed?
    
    open class func generate(seed: AvatarSeed) -> UIImage? {
        customSeed = seed
        return generate(for: seed.size, scale: seed.scale)
    }
    
    open class func generate(for size: CGSize, scale: Int? , complete:@escaping (_ seed: AvatarSeed, _ image:UIImage?) -> ()) {
        let width = Int(customSeed?.size.width ?? size.width)
        let height = Int(customSeed?.size.height ?? size.height)
        
        let pixelSize = scale ?? 20
        
        let totalColumns = width / pixelSize
        let totalRows = height / pixelSize
        
        let wRemainder = width % pixelSize
        let hRemainder = height % pixelSize
        
        //        if #available(iOS 11, *) {
        //            let wRemainder = width.dividedReportingOverflow(by: pixelSize).partialValue
        //            let hRemainder = height.dividedReportingOverflow(by: pixelSize).partialValue
        //        }
        
        let mapValues = customSeed?.map ?? getImageMap(length: totalColumns * totalRows)
        
        let colors = customSeed?.colors ?? Avatar.colors()
        
        var x = 0 //columns counter
        var y = 0 //rows counter
        
        UIGraphicsBeginImageContextWithOptions(size, true, 1)
        let context = UIGraphicsGetCurrentContext()!
        
        for position in 0..<mapValues.count {
            //context stuff
            let colorIndex = mapValues[position]
            var color = UIColor.black
            switch colorIndex {
            case 0:
                color = colors.primary
            case 1:
                color = colors.secondary
            case 2:
                color = colors.tertiary
            default:
                color = .black
            }
            
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: CGFloat(x * pixelSize), y:CGFloat(y * pixelSize), width:CGFloat(pixelSize + (pixelSize * wRemainder)), height:CGFloat(pixelSize + (pixelSize * hRemainder))));
            
            x = x + 1
            
            if x == totalColumns {
                x = 0
                y = y + 1
            }
            
            
        }
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext()
        
        let seed = AvatarSeed(map: mapValues, colors: colors, size: size, scale:pixelSize)
        
        complete(seed, outputImage)
    }
    
    open class func generate(for size: CGSize, scale: Int?) -> UIImage? {
        var outputImage: UIImage?
        
        self.generate(for: size, scale: scale) { (seed, image) in
            outputImage = image
        }
        
        return outputImage
    }
    
}





