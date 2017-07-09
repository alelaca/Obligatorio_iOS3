//
//  ClothesManager.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 28/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class ClothesManager {
    
    var clothesList: [Clothes] = []
	
    static let instance: ClothesManager = ClothesManager()
    
    private init(){
        self.retrieveData()
    }
    
    func loadInitialData(oncompletion: @escaping (_ error: Error?)->()) {
		let databaseRef: FIRDatabaseReference = FIRDatabase.database().reference()
        databaseRef.child("clothes").observe(.childAdded, with: { snapshot in
            if let snapshotValue = snapshot.value as? NSDictionary {
                //let id = snapshot.value as! Int
                let title = snapshotValue["title"] as! String
                let image = snapshotValue["image"] as! String
                let size = snapshotValue["size"] as! String
                
                self.clothesList.append(Clothes(id: 0, title: title, description: "", size: size, image: image))
                oncompletion(nil)
            }
        }
            , withCancel: { error in
                oncompletion(error)
        })
    }
	
	func saveClothes(clothes: Clothes) {
		let databaseRef: FIRDatabaseReference = FIRDatabase.database().reference()
		databaseRef.child("users").child(UserManager.instance.userID).childByAutoId().setValue(clothes)
	}
	
	/*func loadImageFromFirebase(_ imgUrl: String){
		let refSt = storageRef.
		refSt.data(withMaxSize: INT64_MAX){ (data, error) in
			refSt.metadata(completion: { (metadata, error) in
				
			})
		})
	}*/
    
    func retrieveData(){
        
    }
}
