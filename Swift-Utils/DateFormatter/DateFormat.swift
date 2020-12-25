//
//  DateFormat.swift
//  Swift-Utils
//
//  Created by nuomi1 on 4/7/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Foundation

extension DateFormatter {

    public struct DateFormat: RawRepresentable, ExpressibleByStringLiteral {
        public var rawValue: String

        public init?(rawValue: String) {
            self.rawValue = rawValue
        }

        public init(stringLiteral value: String) {
            rawValue = value
        }
    }
}
