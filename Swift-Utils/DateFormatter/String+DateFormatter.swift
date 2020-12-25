//
//  String+DateFormatter.swift
//  Swift-Utils
//
//  Created by nuomi1 on 4/7/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Foundation

extension String {

    public func date(dateFormat: DateFormatter.DateFormat) -> Date? {
        return DateFormatter
            .formatter(dateFormat: dateFormat)
            .date(from: self)
    }

    public func date(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> Date? {
        return DateFormatter
            .formatter(dateStyle: dateStyle, timeStyle: timeStyle)
            .date(from: self)
    }

    public func date(dateStyle: DateFormatter.Style) -> Date? {
        return DateFormatter
            .formatter(dateStyle: dateStyle, timeStyle: .none)
            .date(from: self)
    }

    public func date(timeStyle: DateFormatter.Style) -> Date? {
        return DateFormatter
            .formatter(dateStyle: .none, timeStyle: timeStyle)
            .date(from: self)
    }
}
