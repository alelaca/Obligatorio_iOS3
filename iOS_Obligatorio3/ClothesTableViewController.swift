//
//  ClothesTableViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 28/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit
import Firebase

class ClothesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var clothesTableView: UITableView!
    
    var clothesManager: ClothesManager = ClothesManager.instance
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clothesTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clothesManager.clothesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothesCell", for: indexPath) as! ClothesTableViewCell
        
            let clothes: Clothes = self.clothesManager.clothesList[indexPath.row]
            cell.clothesImageView.image = clothes.imageFile
            cell.titleLabel.text = clothes.title
            cell.sizeLabel.text = clothes.size
		
			// set background color for cardview
			cell.backgroundCardView.backgroundColor = UIColor.white
			cell.contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
		
			cell.backgroundCardView.layer.cornerRadius = 3.0
			cell.backgroundCardView.layer.masksToBounds = false
		
			cell.backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
			cell.backgroundCardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
			cell.backgroundCardView.layer.shadowOpacity = 0.8
        return cell
    }

    // access to clothes detailed information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
