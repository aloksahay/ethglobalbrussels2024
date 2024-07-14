//
//  ProductViewController.swift
//  WayBackMachine
//
//  Created by Alok Sahay on 14.07.2024.
//

import Foundation
import UIKit

struct Timelog {
    
    let location: String
    let timestamp: Date
    
    var formattedTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: timestamp)
    }
    
    init(location: String, timestamp: Date = Date()) {
        self.location = location
        self.timestamp = timestamp
    }
}

class ProductViewController: UIViewController {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var locationsLabel: UILabel!
    
    var timelogs = [Timelog]()
    
    let locations = ["fight.offer.airbag","pose.rewarded.glades", "usages.costs.shady", "owes.plans.brand", "tougher.useful.tickles"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImage.isHidden = true
    }
    
    @IBAction func checkinComplete(_ sender: Any) {
        logTimeStamp()
    }
    
    func scanComplete() {
        itemImage.isHidden = false
        itemImage.image = .sneakers
    }
    
    func logTimeStamp() {
        
        let ranLocation = locations.randomElement() ?? "bound.underway.reaction"
        let newLog = Timelog(location: ranLocation)
        timelogs.append(newLog)
        updateLocationList()
    }
    
    func updateLocationList() {
        var logString = ""
        
        for log in timelogs {
            logString.append("Timestamp: " + log.formattedTimestamp + ", Location: " + log.location + "\n\n")
        }

        locationsLabel.text = logString
    }
    
}
