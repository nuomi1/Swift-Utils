//
//  String+DateFormatter.swift
//  Swift-Utils
//
//  Created by nuomi1 on 4/7/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Foundation

public extension String {
    func date(dateFormat: DateFormatter.DateFormat) -> Date? {
        return DateFormatter.formatter(dateFormat: dateFormat)
            .date(from: self)
    }

    func date(dateStyle: DateFormatter.Style,
              timeStyle: DateFormatter.Style) -> Date? {
        return DateFormatter
            .formatter(dateStyle: dateStyle,
                       timeStyle: timeStyle)
            .date(from: self)
    }

    func date(dateStyle: DateFormatter.Style) -> Date? {
        return DateFormatter
            .formatter(dateStyle: dateStyle,
                       timeStyle: .none)
            .date(from: self)
    }

    func date(timeStyle: DateFormatter.Style) -> Date? {
        return DateFormatter
            .formatter(dateStyle: .none,
                       timeStyle: timeStyle)
            .date(from: self)
    }
}
