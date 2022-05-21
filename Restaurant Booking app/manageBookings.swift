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
    var booking = Booking(name: "", date: Date(), table: 0)
    
    //let bookings = ["Booking 1", "Booking 2", "Booking 3", "Booking 4", "Booking 5"] //Dummy cells for testing

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self //Used for interactions in the Table View
        self.tableView.dataSource = self
        
        //Pulls data from UserDefaults
        bookings = loadBookings()
        
        //To format Date into a String type
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY"
    
        //Retrieves data from UserDefaults
        print("Number of bookings made: " + String(bookings.count) + "\n\n")
        
        
        let numBookings = bookings.count
        var bookingNum = 0
        
        print("Here are the bookings. \n\n")
        
        while (bookingNum < numBookings) {
            booking = bookings[bookingNum]
            print("Booking Number " + String(bookingNum + 1))
            print("Name of Booking is: " + booking.name)
            print("Date of Booking is: " + dateFormatter.string(from: booking.date))
            print("Table of Booking is: " + String(booking.table))
            print("\n\n")
            
            bookingNum += 1
        }
        
        print("")
    }
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


extension manageBookings: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showBookingDetails", sender: self) //Segues into Booking Screen
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
        
        _ = bookings[indexPath.row]
        
        cell.textLabel?.text = booking.name
        cell.detailTextLabel?.text = "Table: \(booking.table)"
        
        return cell
    }
}
