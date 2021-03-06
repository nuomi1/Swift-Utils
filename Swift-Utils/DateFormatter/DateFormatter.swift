//
//  DateFormatter.swift
//  Swift-Utils
//
//  Created by nuomi1 on 4/7/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Foundation

extension DateFormatter {

    fileprivate static let dateFormatters = NSCache<NSString, DateFormatter>()
}

extension DateFormatter {

    fileprivate static func computeCacheKey(dateFormat: DateFormatter.DateFormat) -> String {
        return [
            "format",
            dateFormat.rawValue,
        ]
        .joined(separator: "|")
    }

    fileprivate static func computeCacheKey(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        return [
            "style",
            String(dateStyle.rawValue),
            String(timeStyle.rawValue),
        ]
        .joined(separator: "|")
    }
}

extension DateFormatter {

    internal static func formatter(dateFormat: DateFormatter.DateFormat) -> DateFormatter {
        let cacheKey = computeCacheKey(dateFormat: dateFormat) as NSString

        if let dateFormatter = dateFormatters.object(forKey: cacheKey) {
            return dateFormatter
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue

        dateFormatters.setObject(dateFormatter, forKey: cacheKey)

        return dateFormatter
    }

    internal static func formatter(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> DateFormatter {
        let cacheKey = computeCacheKey(dateStyle: dateStyle, timeStyle: timeStyle) as NSString

        if let dateFormatter = dateFormatters.object(forKey: cacheKey) {
            return dateFormatter
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle

        dateFormatters.setObject(dateFormatter, forKey: cacheKey)

        return dateFormatter
    }
}
