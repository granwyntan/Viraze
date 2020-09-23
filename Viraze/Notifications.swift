//
//  Notifications.swift
//  Viraze
//
//  Created by Granwyn Tan on 23/9/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import Foundation

class ReminderNotifViraze: Codable {
    var name: String
    var done = false
      
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = ""
    }
    
//    static func loadSampleReminderNotifVirazes() -> [ReminderNotifViraze] {
//        return [ReminderNotifViraze(name: "")]
//    }
    
    
    static func getArchiveURL() -> URL {
        let plistName = "ReminderNotifViraze"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    
    static func saveToFile(ReminderNotifViraze: [ReminderNotifViraze]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedReminderNotifVirazes = try? propertyListEncoder.encode(ReminderNotifViraze)
        try? encodedReminderNotifVirazes?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [ReminderNotifViraze]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedReminderNotifsData = try? Data(contentsOf: archiveURL) else { return nil }
        guard let decodedReminderNotifs = try? propertyListDecoder.decode(Array<ReminderNotifViraze>.self, from: retrievedReminderNotifsData) else { return nil }
        return decodedReminderNotifs
    }
}
