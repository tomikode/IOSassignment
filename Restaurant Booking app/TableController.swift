//
//  ViewController.swift
//  Restaurant Booking app
//
//  Created by Tomi Piisila on 1/5/2022.
//

import UIKit

class TableController: UIViewController {
    
    var name = ""
    var date = Date()

    @IBOutlet weak var mapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("next")
        print(name)
        print(date)
//        mapView.frame.size.height *= 2
    }


}

