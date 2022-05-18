//
//  BookingScreen.swift
//  Restaurant Booking app
//
//  Created by CatTuong on 15/05/2022.
//

import UIKit

class BookingScreen: UIViewController {
    
    @IBOutlet weak var nameBookingLabel: UILabel!
    @IBOutlet weak var tableNumberLabel: UILabel!
    @IBOutlet weak var tableForPersonsLabel: UILabel!
    @IBOutlet weak var dateBookingLabel: UILabel!
    @IBOutlet weak var timeBookingLabel: UILabel!
    @IBOutlet weak var infoBookingView: UIView!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        infoBookingView.layer.cornerRadius = 24
        infoBookingView.layer.borderWidth = 1
        infoBookingView.layer.borderColor = UIColor.black.cgColor
        confirmButton.layer.cornerRadius = 12
    }
    
    func setupData(name: String, tableNumber: Int, tableForPersons: Int, date: String, time: String) {
        nameBookingLabel.text = name
        tableNumberLabel.text = "\(tableNumber)"
        tableForPersonsLabel.text = "\(tableForPersons)"
        dateBookingLabel.text = date
        timeBookingLabel.text = time
    }
    
    @IBAction func confirmBooking(_ sender: UIButton) {
        dismiss(animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            present(viewController, animated: true)
        }
    }
}
