//
//  PublishClothesViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 6/7/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit

class PublishClothesViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
	@IBOutlet weak var imageView: UIImageView!
	
	var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// imageView gesture recognizer
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
		imageView.isUserInteractionEnabled = true
		imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func publishButtonAction(_ sender: Any) {
        if verifyClothesData() != "" {
            
        }
    }
    
    func verifyClothesData() -> String {
        if (titleTextField.text == ""){
            return "A title for the clothes is needed"
        }
        if (!sizeSegmentedControl.isSelected){
            return "You need to select the size"
        }
        if (descriptionTextField.text == ""){
            return "A description for the clothes is needed"
        }
        return ""
    }
    
    func getSegmentedControlSelection() -> String {
        if (sizeSegmentedControl.isSelected) {
            if (sizeSegmentedControl.selectedSegmentIndex == 0){
                return "XS"
            }
            else if (sizeSegmentedControl.selectedSegmentIndex == 1){
                return "S"
            }
            else if (sizeSegmentedControl.selectedSegmentIndex == 2){
                return "M"
            }
            else if (sizeSegmentedControl.selectedSegmentIndex == 3){
                return "L"
            }
            else if (sizeSegmentedControl.selectedSegmentIndex == 4){
                return "XL"
            }
        }
        return ""
    }
	func imageTapped(){
		if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
			print("Button capture")
	
			imagePicker.delegate = self
			imagePicker.sourceType = .savedPhotosAlbum;
			imagePicker.allowsEditing = false
	
			self.present(imagePicker, animated: true, completion: nil)
		}
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
		self.dismiss(animated: true, completion: { () -> Void in
		
		})
		
		if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
			imageView.image = possibleImage
		} else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
			imageView.image = possibleImage
		}
	}
}