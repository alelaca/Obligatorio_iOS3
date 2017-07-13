//
//  PublishClothesViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 6/7/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit

class PublishClothesViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
	@IBOutlet weak var imageView: UIImageView!
	
    var descChanged = false
    
	var clothesTemp: Clothes = Clothes()
	
	var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// imageView gesture recognizer
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
		imageView.isUserInteractionEnabled = true
		imageView.addGestureRecognizer(tapGestureRecognizer)
        
        addDescriptionDesign()
    }
    
    @IBAction func publishButtonAction(_ sender: Any) {
        let messageResult: String = verifyClothesData()
        if messageResult != "" {
			clothesTemp.id = "0"
            clothesTemp.title = titleTextField.text
			clothesTemp.description = descriptionTextField.text
			clothesTemp.size = sizeSegmentedControl.titleForSegment(at: sizeSegmentedControl.selectedSegmentIndex)
			ClothesManager.instance.saveClothes(clothes: clothesTemp)
            eraseFields()
        }
        else {
            let alertController = UIAlertController(title: "Message error", message: messageResult, preferredStyle: UIAlertControllerStyle.alert)
            alertController.present(self, animated: true, completion: nil)
        }
    }
    
    func verifyClothesData() -> String {
        if (titleTextField.text == "") {
            return "A title for clothes is needed"
        }
        if (!sizeSegmentedControl.isSelected) {
            return "You need to select the size"
        }
        if (descriptionTextField.text == "") {
            return "A description for clothes is needed"
        }
		if (clothesTemp.imageURL == nil) {
			return "Image missing. Please select one tapping the image box"
		}
        return ""
    }
    
    func eraseFields(){
        titleTextField.text = ""
        descriptionTextField.text = ""
        sizeSegmentedControl.selectedSegmentIndex = -1
        imageView.image = nil
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
	
			imagePicker.delegate = self
			imagePicker.sourceType = .savedPhotosAlbum;
			imagePicker.allowsEditing = false
	
			self.present(imagePicker, animated: true, completion: nil)
		}
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
		self.dismiss(animated: true, completion: { () -> Void in
		
		})
		
		if let imageURL = info[UIImagePickerControllerReferenceURL] as? NSURL {
			clothesTemp.imageURL = imageURL.absoluteString
		}
		
		if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            imageView.image = possibleImage
            clothesTemp.imageFile = possibleImage
		} else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            imageView.image = possibleImage
            clothesTemp.imageFile = possibleImage
		}
	}
    
    
    //UI
    func addDescriptionDesign(){
        
        self.descriptionTextField.layer.borderWidth = 0.5
        self.descriptionTextField.layer.masksToBounds = true
        self.descriptionTextField.layer.cornerRadius = 3.0
        
        
        let color = UIColor(red: 25.0/255.0, green: 50.0/255.0, blue: 60.0/255.0, alpha: 0.3)
        self.descriptionTextField.layer.borderColor = color.cgColor
    }
}
