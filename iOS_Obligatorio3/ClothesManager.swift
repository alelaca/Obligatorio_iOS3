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
        ref.child("clothes").observe(.childAdded, with: { snapshot in
            if let snapshotValue = snapshot.value as? [String:Any]{
                //let id = snapshot.key as! Int
                let title = snapshotValue["title"] as! String
                let image = snapshotValue["image"] as! String
                let size = snapshotValue["size"] as! String
                
                self.clothesList.append(Clothes(id: 0, title: title, description: "", size: size, image: image))
            }
        }
            , withCancel: { error in
                // imprimir un error en pantalla
        })
    }
}
