//
//  MenuViewController.swift
//  Restaurant Booking app
//
//  Created by Gia Phat Huynh on 18/5/22.
//

import UIKit
class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    //data array for the menu
    let titleData = ["Pizza", "Pasta", "Lasagna", "Risotto", "Gelato"]
    let descripData = ["Try out our special pizza", "Try out our special pasta", "Try out our special lasagna", "Try out our special risotto", "Try out our special Gelato" ]
    let imagesF = [UIImage(named:"Pizza"), UIImage(named:"Pasta"), UIImage(named:"Lasagna"), UIImage(named:"Risotto"), UIImage(named:"Gelato")]
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MenuTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // tableView functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleData.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.myLabel.text = titleData[indexPath.row]
        cell.myImageView.image = self.imagesF[indexPath.row]
        cell.descripLabel.text = descripData[indexPath.row]
        return cell
    }
}
