//
//  StringDateToFullDateExtension.swift
//  MacPaw-TestTask
//
//  Created by Hulkevych on 27.08.2023.
//

import Foundation

extension String {
    var formatedToFullDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.locale = Locale(identifier: "uk_UA")
            outputFormatter.setLocalizedDateFormatFromTemplate("dd MMMM yyyy")
            return outputFormatter.string(from: date)
        }
        
        return "Invalid date format"
    }
}
