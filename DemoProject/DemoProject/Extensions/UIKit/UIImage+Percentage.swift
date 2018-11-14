//
//  UIImage+Percentage.swift
//  DemoProject
//
//  Created by STV_Okudera on 2018/11/15.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 2色間の変化の割合を指定し、その時点の色を取得する
    static func colorForOffsetPercentage(percentage: CGFloat,
                                         beforeColor: UIColor,
                                         afterColor: UIColor) -> UIColor {
        
        let beforeRGB = beforeColor.rgb()
        let afterRGB = afterColor.rgb()
        
        let red = (afterRGB.red - beforeRGB.red) * percentage + beforeRGB.red
        let blue = (afterRGB.blue - beforeRGB.blue) * percentage + beforeRGB.blue
        let green = (afterRGB.green - beforeRGB.green) * percentage + beforeRGB.green
        let alpha = (afterRGB.alpha - beforeRGB.alpha) * percentage + beforeRGB.alpha
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private func rgb() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
}
