//
//  manageBookings.swift
//  Restaurant Booking app
//
//  Created by Jessica Philip on 17/5/22.
//

import UIKit

class manageBookings: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let bookings = ["Booking 1", "Booking 2", "Booking 3", "Booking 4", "Booking 5"] //Dummy cells for testing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self //Used for interactions in the Table View
        tableView.dataSource = self
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
        
        cell.textLabel?.text = bookings[indexPath.row]
        
        return cell
    }
}
