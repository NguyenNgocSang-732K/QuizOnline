//
//  Date+Extension.swift
//  Online Test
//
//  Created by vinova on 4/2/21.
//

import Foundation





extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
