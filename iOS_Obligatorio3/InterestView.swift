//
//  InterestView.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 22/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//
import Koloda
import UIKit

class InterestView: KolodaView {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    init(imageView: UIImageView, titleLabel: UILabel){
        super(init)
        imageView.image = UIImage(named: "img_prueba.jpeg")
        titleLabel.text = "Prueba"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
