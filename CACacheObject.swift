//
//  Cacira Cache Object
//  CACacheObject.swift
//
//  Cache library in Swift for iOS using NSUserDefaults.
//
//  Created by Carlos Torres <carlos.torres@cacira.com> on 10/5/16.
//  Copyright © 2016 Cacira, Inc. All rights reserved.
//

import Foundation

class CACacheObject: NSObject, NSCoding {

    var storedDate: NSDate
    var storedContent: AnyObject

    init(content: AnyObject, date: NSDate = NSDate()) {
        self.storedContent = content
        self.storedDate = date
    }

    //MARK: NSCoding

    required convenience init?(coder aDecoder: NSCoder) {
        let storedDate = aDecoder.decodeObjectForKey("storedDate") as! NSDate
        let storedContent = aDecoder.decodeObjectForKey("storedContent")! as AnyObject
        self.init(content: storedContent, date: storedDate)
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.storedDate, forKey: "storedDate")
        aCoder.encodeObject(self.storedContent, forKey: "storedContent")
        print("Stored date: \(self.storedDate)")
    }
}
