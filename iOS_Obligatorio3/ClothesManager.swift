//
//  ClothesManager.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 28/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation
import Firebase

class ClothesManager {
    var clothesList: [Clothes] = []
    
    func loadInitialData(ref: FIRDatabaseReference){
        ref.child("clothes").observeSingleEvent(of: .value, with: { (snapshot) in
            let enumerator = snapshot.children
            while let item = enumerator.nextObject() as? FIRDataSnapshot {
                // rest.value
            }
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
