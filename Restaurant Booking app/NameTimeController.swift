//
//  ViewController.swift
//  Restaurant Booking app
//
//  Created by Tomi Piisila on 1/5/2022.
//

import UIKit

class NameTimeController: UIViewController {
    
    var name = ""
    var date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Swift.print("works")
    }

    
    @IBAction func nameEdit(_ sender: UITextField, forEvent event: UIEvent) {
        name = sender.text ?? ""
    }
    
    @IBAction func dateEdit(_ sender: UIDatePicker, forEvent event: UIEvent) {
        date = sender.date
    }
    
    @IBAction func nextClick(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tableSegue", sender: nil)
    }
    
    //fix up time difference
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "tableSegue") {
            if let destVC = segue.destination as? TableController {
                destVC.name = name
                destVC.date = date
            }
        }
    }
    
}

