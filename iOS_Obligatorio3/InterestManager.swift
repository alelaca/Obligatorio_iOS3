//
//  Interests.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 21/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation

class InterestManager {
    var interestList: [Interest] = []
    
    func addInterest(interest: Interest){
        self.interestList.append(interest)
    }
}
