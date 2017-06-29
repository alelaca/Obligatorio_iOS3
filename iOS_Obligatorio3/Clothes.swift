//
//  Clothes.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 28/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation

class Clothes {
    var id: Int!
    var title: String!
    var description: String!
    var size: String!
    var image: String!
    var tags: [String] = []
    
    init(id: Int, title: String, description: String, size: String, image: String){
        self.id = id
        self.title = title
        self.description = description
        self.size = size
        self.image = image
    }
    
    func addTag(tag: String){
        tags.append(tag)
    }
    
    func removeTag(tag: String) {
        tags = [tags.remove(at: tags.index(of: tag)!)]
    }
}
