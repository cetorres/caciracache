//
//  Cacira Cache
//  CACache.swift
//
//  Cache library in Swift for iOS using NSUserDefaults.
//
//  Created by Carlos Torres <carlos.torres@cacira.com> on 10/5/16.
//  Copyright © 2016 Cacira, Inc. All rights reserved.
//

import Foundation

let MAX_CACHE_AGE : Double = 24 * 60 * 60 // 24 hours

class CACache {

    // Save object to cache
    class func setObject(object: CACacheObject, forKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let data = NSKeyedArchiver.archivedDataWithRootObject(object)
        defaults.setObject(data, forKey: key)
        defaults.synchronize()
    }

    // Get object from cache within a max cache age (NSTimeInterval), default 24h
    class func getObject(fromKey key: String, withMaxCacheAge maxCacheAge: Double = MAX_CACHE_AGE) -> CACacheObject? {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let data = defaults.objectForKey(key) as? NSData {
            if let decodedData = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? CACacheObject {
                let storedDate = decodedData.storedDate
                let now = NSDate()
                let cacheAge = secondsBetween(storedDate, endDate: now)
                if cacheAge <= maxCacheAge {
                    return decodedData
                }
            }
        }
        return nil
    }

    // Clear object from cache
    class func clearObject(forKey key: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey(key)
        defaults.synchronize()
    }

    // Calculate differente between two dates in seconds
    class func secondsBetween(startDate: NSDate, endDate: NSDate) -> Double? {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Second], fromDate: startDate, toDate: endDate, options: [])
        return Double(components.second)
    }
}
