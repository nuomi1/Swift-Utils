//
//  Date+FormatStyle.swift
//  Swift-Utils
//
//  Created by nuomi1 on 7/7/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Foundation

public extension Date {
    enum FormatStyle {
        case short
        case normal
        case long
    }

    func string(for style: FormatStyle) -> String {
        switch style {
        case .short:
            return string(dateFormat: .HHmm)
        case .normal:
            let now = Date()

            guard self <= now else {
                return string(dateFormat: .yyyyMMddHHmm)
            }

            let originYear = Calendar.current.component(.year, from: self)
            let nowYear = Calendar.current.component(.year, from: now)

            guard originYear == nowYear else {
                return string(dateFormat: .yyyyMMddHHmm)
            }

            let originDays = Calendar.current.ordinality(of: .day,
                                                         in: .year,
                                                         for: self)
            let nowDays = Calendar.current.ordinality(of: .day,
                                                      in: .year,
                                                      for: now)

            switch nowDays! - originDays! {
            case 3...:
                return string(dateFormat: .MMddHHmm)
            case 2:
                return "前天" + string(dateFormat: .HHmm)
            case 1:
                return "昨天" + string(dateFormat: .HHmm)
            default:
                let difference = Calendar.current.dateComponents([.hour, .minute],
                                                                 from: self,
                                                                 to: now)

                guard difference.hour! < 1 else {
                    return "\(difference.hour!)小时前"
                }

                guard difference.minute! < 1 else {
                    return "\(difference.minute!)分钟前"
                }

                return "刚刚"
            }
        case .long:
            return Calendar.current.compare(self,
                                            to: Date(),
                                            toGranularity: .year)
                == .orderedSame
                ? string(dateFormat: .MMddHHmm)
                : string(dateFormat: .yyyyMMddHHmm)
        }
    }
}

private extension DateFormatter.DateFormat {
    static let HHmm: DateFormatter.DateFormat = "HH:mm"
    static let MMddHHmm: DateFormatter.DateFormat = "MM-dd HH:mm"
    static let yyyyMMddHHmm: DateFormatter.DateFormat = "yyyy-MM-dd HH:mm"
}
