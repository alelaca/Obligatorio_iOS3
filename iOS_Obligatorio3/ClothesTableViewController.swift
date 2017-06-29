//
//  ClothesTableViewController.swift
//  iOS_Obligatorio3
//
//  Created by SP07 on 28/6/17.
//  Copyright © 2017 Apple, Inc. All rights reserved.
//

import UIKit

class ClothesTableViewController: UITableViewController {
    
    var clothesManager: ClothesManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clothesManager = ClothesManager() // todo: hacerlo singleton
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClothesCell", for: indexPath) as! ClothesTableViewCell
        
        let clothes: Clothes = self.clothesManager.clothesList[indexPath.row]
        cell.clothesImageView.image = UIImage(named: clothes.image)
        cell.titleLabel.text = clothes.title
        cell.sizeLabel.text = clothes.size
        
        return cell
    }

    // access to clothes detailed information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 

}
