//
//  InterestsViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 21/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit
import Koloda
import Firebase

class InterestsViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
    
    @IBOutlet weak var kolodaView: KolodaView!
    
    var clothesManager: ClothesManager = ClothesManager.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //interestManager.addInterest(interest: Interest(image: UIImage(named: "img_prueba.jpeg")!, name: "Prueba", size: ClothesSize.M))
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    
        // load data from firebase
        clothesManager.loadInitialData() {_ in
            self.kolodaView.reloadData()
        }
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection){
        if direction == SwipeResultDirection.left{
            print("Left")
        }
        else if direction == SwipeResultDirection.right{
            print("Right")
        }
    }
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return clothesManager.clothesList.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let clothes: Clothes = clothesManager.clothesList[index]
        return InterestView.create(imageName: clothes.imageURL, title: clothes.title, size: clothes.size)
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed{
        return .default
    }

}
