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
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var dateError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        // Do any additional setup after loading the view.
        Swift.print("works")
    }

    
    @IBAction func nameEdit(_ sender: UITextField, forEvent event: UIEvent) {
        name = sender.text ?? ""
        checkValues()
    }
    
    @IBAction func dateEdit(_ sender: UIDatePicker, forEvent event: UIEvent) {
        date = sender.date
        date = Calendar.current.date(byAdding: .hour, value: 10, to: date) ?? sender.date
        print(date)
        checkValues()
    }
    
    @IBAction func nextClick(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tableSegue", sender: nil)
    }
    
    func checkValues(){
        var tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        tomorrow = Calendar.current.date(byAdding: .hour, value: 10, to: tomorrow!)
        
        if (name == ""){
            nameError.text = "Enter a name"
        } else {
            nameError.text = ""
        }
        
        if (date < tomorrow!){
            dateError.text = "Select a date at least a day from now"
        } else {
            dateError.text = ""
        }
        if (name != "" && date >= tomorrow!){
            nextButton.isEnabled = true
            nextButton.backgroundColor = .systemGreen
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .systemGray
        }
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

