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
        
        interestManager.addInterest(interest: Interest(image: UIImage(named: "img_prueba.jpeg")!, name: "Prueba", size: ClothesSize.M))
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
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
        return interestManager.interestList.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        //return UIImageView(image: interestManager.interestList[index].image)
        return InterestView()
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed{
        return .default
    }

}
