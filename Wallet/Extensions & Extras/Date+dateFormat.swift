//
//  Date+dateFormat.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

extension String {
    func returnDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm MMM d"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date: Date? = dateFormatter.date(from: self)
        
        return date?.description ?? "1:15pm, 10 Jun 2022 "
    }
}
