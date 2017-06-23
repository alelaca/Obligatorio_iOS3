//
//  Interest.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 21/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation
import UIKit

class Interest {
    var image: UIImage!
    var name: String!
    var size: ClothesSize!
    
    // clothes id to show info when tapped on interest
    var clothesId: Int!
    
    init(image: UIImage, name: String, size: ClothesSize){
        self.image = image
        self.name = name
        self.size = size
    }
}

enum ClothesSize {
    case XS
    case S
    case M
    case L
    case XL
}
