//
//  InterestView.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 22/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//
import Koloda
import UIKit

class InterestView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static func create(imageName: String, title: String, size: String) -> InterestView {
        if let view = Bundle.main.loadNibNamed("InterestView", owner: nil, options: nil)?.first as? InterestView {
            view.imageView.image = UIImage(named: "img_prueba.jpeg")
            view.titleLabel.text = title
            return view
        }
        
        fatalError("Couldn`t load the image")
    }
}
