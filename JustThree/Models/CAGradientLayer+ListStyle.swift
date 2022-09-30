//
//  CAGradientLayer+ListStyle.swift
//  JustThree
//
//  Created by Sanghun Park on 30.09.22.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(for style: ReminderListStyle, in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors(for: style)
        layer.frame = frame
        return layer
    }
    
    private static func colors(for style: ReminderListStyle) -> [CGColor] {
        let beginColor: UIColor
        let endColor: UIColor
        
        switch style {
        case .all:
            beginColor = .justThreeGradientAllBegin
            endColor = .justThreeGradientAllEnd
        case .future:
            beginColor = .justThreeGradientFutureBegin
            endColor = .justThreeGradientFutureEnd
        case .today:
            beginColor = .justThreeGradientTodayBegin
            endColor = .justThreeGradientTodayEnd
        }
        return [beginColor.cgColor, endColor.cgColor]
    }
}
