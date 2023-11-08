//
//  NoteUtility.swift
//  NoteAppDemo
//
//  Created by PhyuSandy Myat on 2023/11/08.
//

import Foundation

struct NoteUtility {
    
    static func getDateTime() -> String {
        
        let currentDateTime = Date()
        let userCalendar = Calendar.current
        let requestedComponents: Set<Calendar.Component> = [
            .year,
            .month,
            .day,
            .hour,
            .minute,
            .second,
            .nanosecond
        ]

        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
        
        let year : String = String(format: "%04d", dateTimeComponents.year!)
        let month : String = String(format: "%02d", dateTimeComponents.month!)
        let day : String = String(format: "%02d", dateTimeComponents.day!)
        let hour : String = String(format: "%02d", dateTimeComponents.hour!)
        let minute : String = String(format: "%02d", dateTimeComponents.minute!)
        let second : String = String(format: "%02d", dateTimeComponents.second!)
        let nanosecond : String = String(dateTimeComponents.nanosecond!)
        
        let dt =  "\(year)-\(month)-\(day) \(hour):\(minute):\( second):\(nanosecond)"
        //print(dt)
        
        return dt
    }
    
    static func cutDateTimeToSeconds (DateTime: String) -> String {
        return String("\(DateTime)".prefix(19))
    }
    
}
