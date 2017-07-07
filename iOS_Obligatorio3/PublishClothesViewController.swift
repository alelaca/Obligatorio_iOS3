//
//  PublishClothesViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 6/7/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit

class PublishClothesViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

}
