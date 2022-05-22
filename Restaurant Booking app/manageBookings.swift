//
//  manageBookings.swift
//  Restaurant Booking app
//
//  Created by Jessica Philip on 17/5/22.
//

import UIKit

class manageBookings: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var bookings: [Booking] = []
    
    override func loadView() {
        bookings = loadBookings()
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self //Used for interactions in the Table View
        tableView.dataSource = self
    }
    
    func writeBookings() {
        let defaults = UserDefaults.standard;
        defaults.set(try? PropertyListEncoder().encode(bookings), forKey: BOOKINGS_KEY)
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
}

extension manageBookings: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let bookingScreen = storyboard.instantiateViewController(withIdentifier: "BookingScreen") as! BookingScreen
        bookingScreen.indexBooking = indexPath.row
        navigationController?.pushViewController(bookingScreen, animated: true)
    }
}

extension manageBookings: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bookings.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //Using a previous available cell as a template for a new cell in Table View

        let booking = bookings[indexPath.row]
        let showDate = booking.date.formatted(date: .numeric, time: .shortened)
        
        cell.textLabel?.text = booking.name
        cell.detailTextLabel?.text = showDate
        
        return cell
    }
}
