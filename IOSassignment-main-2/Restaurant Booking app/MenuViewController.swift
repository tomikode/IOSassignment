//
//  MenuViewController.swift
//  Restaurant Booking app
//
//  Created by Gia Phat Huynh on 18/5/22.
//

import UIKit
class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    //data array for the menu where titles, prices, description of menu items can be changed
    let titleData = ["Pizza", "Pasta", "Lasagna", "Risotto", "Gelato"]
    let priceData = ["$24","$18","$19","$15","$8"]
    let descripData = ["Try out our special pizza. It is topped with tomatoes, mozzarella and othere cheeses and other toppings of your choice. Contains milk and gluten", "Try out our special pasta. Home made pasta with tomato, olives, and basil. Contains milk and gluten", "Try out our special lasagna. It is topped with tomatoes, mozzarella and othere cheeses and other toppings of your choice. Contains milk and gluten ", "Try out our special risotto. It is topped with tomatoes, mozzarella and othere cheeses and other toppings of your choice. Contains milk and gluten", "Try out our special Gelato. Homemade by a family recipe. Contains milk and nuts"]
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
    //dequeuing functions
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.myLabel.text = titleData[indexPath.row]
        cell.myImageView.image = self.imagesF[indexPath.row]
        cell.descripLabel.text = descripData[indexPath.row]
        cell.priceLabel.text = priceData[indexPath.row]
        return cell
    }
    
/*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let currentImage = imagesF[indexPath.row]
            let imageCrop = currentImage!.getCropRatio()
            return tableView.frame.width / imageCrop
        }
    }

    // Determining the imaging ratio for images compatability for different devices
    extension UIImage{
        func getCropRatio() -> CGFloat{
            let widthRatio = self.size.width / self.size.height
            return widthRatio
        }*/
}
