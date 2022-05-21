//
//  ViewController.swift
//  Restaurant Booking app
//
//  Created by Tomi Piisila on 1/5/2022.
//

import UIKit

struct Booking: Codable {
    var name: String
    var date: Date
    var table: Int
}

let BOOKINGS_KEY = "bookings"

class TableController: UIViewController {
    
    var name = ""
    var date = Date()
    var table = 0

    @IBOutlet weak var table1: UIButton!
    @IBOutlet weak var table2: UIButton!
    @IBOutlet weak var table3: UIButton!
    @IBOutlet weak var table4: UIButton!
    @IBOutlet weak var table5: UIButton!
    @IBOutlet weak var table6: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    var bookings: [Booking] = []
    
    @IBOutlet weak var mapView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.isEnabled = false
        bookings = loadBookings()
        blockTables()
    }

    @IBAction func selectTable(sender: AnyObject){
        guard let button = sender as? UIButton else {
            return
        }
        let tables = [table1, table2, table3, table4, table5, table6]
        for table in tables {
            if (table?.backgroundColor != .black){
                table?.backgroundColor = .systemGreen
            }
        }
        table = button.tag
        button.backgroundColor = .blue
        print(table)
        confirmButton.isEnabled = true
        confirmButton.backgroundColor = .systemGreen
    }
    
    @IBAction func confirmBooking(_ sender: UIButton) {
        
        let newBooking = Booking(name: name, date: date, table: table)
        var position = 0
        for booking in bookings {
            if (newBooking.date < booking.date) {
                break
            }
            position += 1
        }
        bookings.insert(newBooking, at: position)
        print(bookings)
        writeBookings()
        self.performSegue(withIdentifier: "confirmSegue", sender: nil)
        
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
    
    func blockTables() {
        for booking in bookings {
            let endDate = Calendar.current.date(byAdding: .hour, value: 2, to: booking.date) ?? booking.date
            if (date >= booking.date && date < endDate){
                block(table: booking.table)
            }
        }
    }
    
    func block(table: Int){
        let tables = [table1, table2, table3, table4, table5, table6]
        tables[table - 1]?.isEnabled = false
        tables[table - 1]?.backgroundColor = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "confirmSegue") {
            if let destVC = segue.destination as? ViewController {
                destVC.navigationItem.setHidesBackButton(true, animated: true)
                let success = BookSuccess()
                destVC.view.addSubview(success)
            }
        }
    }
    
}

