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
        databaseRef.child("users").observe(.childAdded, with: { snapshot in
            if let snapshotValue = snapshot.value as? NSDictionary {
                for (key,value) in snapshotValue {
                    if let clothes = value as? NSDictionary {
                        let id = key as! String
                        let title = clothes["title"] as! String
                        let imageURL = clothes["imageUrl"] as! String
                        let description = clothes["description"] as! String
                        let size = clothes["size"] as! String
                        
                        let clothes = Clothes(id: id, title: title, description: description, size: size, image: imageURL)
                        self.clothesList.append(clothes)
                        self.loadImageFromFirebase(uid: imageURL, clothes: clothes)
                    }
                }
                
                oncompletion(nil)
            }
        }
            , withCancel: { error in
                oncompletion(error)
        })
    }
	
    func saveClothes(clothes: Clothes) {
        let databaseRef: FIRDatabaseReference = FIRDatabase.database().reference()
        let clothesRefId = databaseRef.child("users").child(UserManager.instance.userID).childByAutoId()
        clothesRefId.setValue(clothes.dataToFirebase())
        saveImageToFirebase(image: clothes.imageFile, imageName: clothesRefId.key)
    }
    
    func saveImageToFirebase(image: UIImage, imageName: String) {
        var data = NSData()
        data = UIImageJPEGRepresentation(image, 0.8)! as NSData
        
        //let filePath = "clothes\(FIRAuth.auth()!.currentUser!.uid)/\("userPhoto")"
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpg"
        
        let storageRef = FIRStorage.storage().reference()
        let databaseRef: FIRDatabaseReference = FIRDatabase.database().reference()
        storageRef.child("clothes").child(FIRAuth.auth()!.currentUser!.uid).child(imageName).put(data as Data, metadata: metaData){(metaData,error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                //store downloadURL
                let downloadURL = metaData!.downloadURL()!.absoluteString
                //store downloadURL at database
                databaseRef.child("users").child(FIRAuth.auth()!.currentUser!.uid).child(imageName).updateChildValues(["imageUrl": downloadURL])
            }
            
        }
    }

    func loadImageFromFirebase(uid: String, clothes: Clothes){
        let storageRef = FIRStorage.storage().reference()
        let databaseRef: FIRDatabaseReference = FIRDatabase.database().reference()
        databaseRef.child("users").child(FIRAuth.auth()!.currentUser!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            // check if user has photo
            if snapshot.hasChild("userPhoto"){
                // set image locatin
                // Assuming a < 10MB file, though you can change that
                storageRef.child("users").child(FIRAuth.auth()!.currentUser!.uid).child("").data(withMaxSize: 10*1024*1024, completion: { (data, error) in
                    
                    clothes.imageFile = UIImage(data: data!)
                })
            }
        })
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
