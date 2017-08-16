//
//  AvatarMap.swift
//  Avatar
//
//  Created by William Vabrinskas on 8/16/17.
//  Copyright © 2017 williamvabrinskas. All rights reserved.
//

import Foundation
import UIKit

public struct AvatarSeed {
    var map:[Int]!
    var colors:Colors!
    var size:CGSize!
    var scale:Int!
    
    init(map:[Int], colors:Colors!, size:CGSize, scale:Int) {
        self.map = map
        self.colors = colors
        self.size = size
        self.scale = scale
    }

}
