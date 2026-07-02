//
//  UIColor+Extension.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 9/21/24.
//

import UIKit

extension UIColor {
    convenience init?(hex: String) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexFormatted = hexFormatted.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgb)

        let red, green, blue: CGFloat

        switch hexFormatted.count {
        case 3: // RGB (e.g., "RGB")
            red = CGFloat((rgb >> 16) & 0xF) / 15.0
            green = CGFloat((rgb >> 8) & 0xF) / 15.0
            blue = CGFloat(rgb & 0xF) / 15.0
        case 6: // RRGGBB (e.g., "RRGGBB")
            red = CGFloat((rgb >> 16) & 0xFF) / 255.0
            green = CGFloat((rgb >> 8) & 0xFF) / 255.0
            blue = CGFloat(rgb & 0xFF) / 255.0
        default:
            return nil
        }

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
