//
//  BookSuccess.swift
//  Restaurant Booking app
//
//  Created by Tomi Piisila on 20/5/2022.
//

import UIKit

class BookSuccess: UIButton {
    
    let swidth = UIScreen.main.bounds.width
    let sheight = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let width = swidth * 0.9
        let height = sheight * 0.1
        let x = (swidth/2) - (width/2)
        let y = CGFloat(40)
        self.backgroundColor = .systemGreen
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        self.layer.cornerRadius = 10
        self.setTitle("Booking Success!", for: .normal)
        self.setTitleColor(.white, for: .normal)
        print(sheight/30)
        self.titleLabel?.font = UIFont(name: "Arial", size: sheight/40)
        disappear()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) not implemented")
    }
    
    func disappear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.removeFromSuperview()
        }
    }
    
}
