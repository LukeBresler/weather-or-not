//
//  DateFormatterUtility.swift
//  Weather Or Not
//
//  Created by Luke Bresler on 2025/03/11.
//
import Foundation

class DateFormatterUtility {
    static func getDayOfWeek(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
