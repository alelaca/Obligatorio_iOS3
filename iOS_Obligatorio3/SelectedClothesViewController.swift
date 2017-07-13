//
//  SelectedClothesViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 12/7/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit

class SelectedClothesViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var sizeLabel: UILabel!
    
    var clothes: Clothes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDescriptionDesign()
        
        imageView.image = clothes?.imageFile
        titleLabel.text = clothes?.title
        descriptionLabel.text = clothes?.description
        sizeLabel.text = clothes?.size
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addDescriptionDesign(){
        
        self.descriptionLabel.layer.borderWidth = 0.5
        self.descriptionLabel.layer.masksToBounds = true
        self.descriptionLabel.layer.cornerRadius = 3.0
        
        
        let color = UIColor(red: 25.0/255.0, green: 50.0/255.0, blue: 60.0/255.0, alpha: 0.3)
        self.descriptionLabel.layer.borderColor = color.cgColor
    }
}
