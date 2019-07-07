//
//  Date+DateFormatter.swift
//  Swift-Utils
//
//  Created by nuomi1 on 4/7/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Foundation

public extension Date {
    func string(dateFormat: DateFormatter.DateFormat) -> String {
        return DateFormatter
            .formatter(dateFormat: dateFormat)
            .string(from: self)
    }

    func string(dateStyle: DateFormatter.Style,
                timeStyle: DateFormatter.Style) -> String {
        return DateFormatter
            .formatter(dateStyle: dateStyle,
                       timeStyle: timeStyle)
            .string(from: self)
    }

    func string(dateStyle: DateFormatter.Style) -> String {
        return string(dateStyle: dateStyle,
                      timeStyle: .none)
    }

    func string(timeStyle: DateFormatter.Style) -> String {
        return string(dateStyle: .none,
                      timeStyle: timeStyle)
    }
}
