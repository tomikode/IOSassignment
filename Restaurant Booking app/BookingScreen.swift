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
    @IBOutlet weak var infoBookingView: UIView!
    @IBOutlet weak var cancelBooking: UIButton!
    
    var indexBooking: Int = 0
    
    var bookings: [Booking] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        infoBookingView.layer.cornerRadius = 24
        infoBookingView.layer.borderWidth = 1
        infoBookingView.layer.borderColor = UIColor.black.cgColor
        cancelBooking.layer.cornerRadius = 12
        navigationItem.title = "Booking Info"
    }
    
    func setupData() {
        bookings = loadBookings()
        if !bookings.isEmpty && indexBooking < bookings.count {
            nameBookingLabel.text = bookings[indexBooking].name
            tableNumberLabel.text = "\(bookings[indexBooking].table)"
            tableForPersonsLabel.text = "\(setupTable(table: bookings[indexBooking].table))"
            dateBookingLabel.text = bookings[indexBooking].date.formatted(date: .numeric, time: .shortened)
        }
    }
    
    func setupTable(table: Int) -> Int {
        if (table <= 4){
            return 4
        } else {
            return 8
        }
    }
    
    @IBAction func cancelBooking(_ sender: UIButton) {
        removeBooking()
        let alert = UIAlertController(title: "Alert", message: "Booking canceled successfully", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { _ in
            let vc = self.navigationController
            let lastvc = vc?.viewControllers[(vc?.viewControllers.count)! - 2]
            vc?.popViewController(animated: true)
            lastvc?.loadView()
            lastvc?.viewDidLoad()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func loadBookings() -> [Booking] {
        let defaults = UserDefaults.standard;

        if let savedArray = defaults.value(forKey: BOOKINGS_KEY) as? Data {
            if let bookings = try? PropertyListDecoder().decode(Array<Booking>.self, from: savedArray) {
                return bookings
            }
        }
        
        return []
    }
    
    func removeBooking() {
        if indexBooking < bookings.count {
            bookings.remove(at: indexBooking)
            let defaults = UserDefaults.standard;
            defaults.set(try? PropertyListEncoder().encode(bookings), forKey: BOOKINGS_KEY)
        }
    }
}
