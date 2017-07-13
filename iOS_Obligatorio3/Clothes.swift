//
//  Clothes.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 28/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation
import UIKit

class Clothes {
    var id: String!
    var title: String!
    var description: String!
    var size: String!
    var imageURL: String! = ""
    var imageFile: UIImage!
    var tags: [String] = []
    
    init(id: String, title: String, description: String, size: String, image: String){
        self.id = id
        self.title = title
        self.description = description
        self.size = size
        self.imageURL = image
    }
    
    init(){
        
    }
    
    func addTag(tag: String){
        tags.append(tag)
    }
    
    func removeTag(tag: String) {
        tags = [tags.remove(at: tags.index(of: tag)!)]
    }
    
    func dataToFirebase() -> Any {
        return [
            "title": self.title,
            "size": self.size,
            "description": self.description,
            "imageURL": self.imageURL
        ]
    }
}
