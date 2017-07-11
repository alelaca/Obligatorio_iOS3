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
        databaseRef.child("users").child(UserManager.instance.userID).childByAutoId().setValue(clothes.dataToFirebase())
        saveImageToFirebase(image: clothes.imageFile)
    }
    
    func saveImageToFirebase(image: UIImage) {
        var data = NSData()
        data = UIImageJPEGRepresentation(image, 0.8)! as NSData
        
        //let filePath = "clothes\(FIRAuth.auth()!.currentUser!.uid)/\("userPhoto")"
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpg"
        
        let storageRef = FIRStorage.storage().reference()
        let databaseRef: FIRDatabaseReference = FIRDatabase.database().reference()
        storageRef.child("clothes").child(FIRAuth.auth()!.currentUser!.uid).put(data as Data, metadata: metaData){(metaData,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                //store downloadURL
                let downloadURL = metaData!.downloadURL()!.absoluteString
                //store downloadURL at database
                databaseRef.child("users").child(FIRAuth.auth()!.currentUser!.uid).updateChildValues(["userPhoto": downloadURL])
            }
            
        }
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
