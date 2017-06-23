//
//  InterestsViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 21/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit
import Koloda

class InterestsViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
    
    @IBOutlet weak var kolodaView: KolodaView!
    var interestManager: InterestManager = InterestManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        interestManager.addInterest(interest: Interest(image: UIImage(named: "img_prueba.jpeg")!, name: "Prueba", size: ClothesSize.M))
    }
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return interestManager.interestList.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: interestManager.interestList[index].image)
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView",
                                                  owner: self, options: nil)?[0] as? OverlayView
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed{
        return .default
    }

}
