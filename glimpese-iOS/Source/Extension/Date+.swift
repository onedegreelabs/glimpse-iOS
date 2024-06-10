//
//  Date+.swift
//  glimpese-iOS
//
//  Created by 서원진 on 2024/01/25.
//

import Foundation

func formatDate(inputDate: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    if let date = dateFormatter.date(from: inputDate) {
        let formattedDateFormatter = DateFormatter()
        formattedDateFormatter.dateFormat = "MMM dd, yyyy EEEE"
        return formattedDateFormatter.string(from: date)
    } else {
        return ""
    }
}

func formatTime(inputDate: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

    if let date = dateFormatter.date(from: inputDate) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        timeFormatter.amSymbol = "AM"
        timeFormatter.pmSymbol = "PM"
        timeFormatter.locale = Locale(identifier: "en_US")
        return timeFormatter.string(from: date)
    } else {
        return "Unknown Time"
    }
}
