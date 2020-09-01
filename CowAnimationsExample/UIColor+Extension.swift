//
//  UIColor+Extension.swift
//  InfinityAdventureGame
//
//  Created by steven on 2020/6/3.
//  Copyright © 2020 steven. All rights reserved.
//

import UIKit

extension UIColor {
    
    //創建RGB顏色
    convenience init(r:CGFloat , g:CGFloat, b:CGFloat , alpha:CGFloat = 1.0) {
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    //創建Hex顏色
    convenience init?(hex:String, alpha:CGFloat = 1.0) {
        
        //判斷是否大於六
        if  hex.count < 6 {
            return nil
        }
        
        
        //轉為大寫
        var tempHex = hex.uppercased()
        
        if hex.hasPrefix("0x") || hex.hasPrefix("##") {
            tempHex = (hex as NSString).substring(from: 2)
        }
        
        if hex.hasPrefix("#") {
            tempHex = (hex as NSString).substring(from: 1)
        }
        
        //取出RGB
        let hexR = (tempHex as NSString).substring(with: NSRange(location: 0, length: 2))
        let hexG = (tempHex as NSString).substring(with: NSRange(location: 2, length: 2))
        let hexB = (tempHex as NSString).substring(with: NSRange(location: 4, length: 2))
        
        var r:UInt32 = 0
        var g:UInt32 = 0
        var b:UInt32 = 0
        
        Scanner(string: hexR).scanHexInt32(&r)
        Scanner(string: hexG).scanHexInt32(&g)
        Scanner(string: hexB).scanHexInt32(&b)
        
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
    
    func rgbComponent() -> (CGFloat,CGFloat,CGFloat) {
        
        guard let rgbComponent = cgColor.components else {
            fatalError("保證選中的顏色是以RGB傳入")
        }
        
        return (rgbComponent[0] * 255 , rgbComponent[1] * 255 ,rgbComponent[2] * 255 )
    }
    
    class func rgbDelta(_ firstColor:UIColor ,_ seconedColor:UIColor) -> (CGFloat,CGFloat,CGFloat) {
        
        guard let firstComponent = firstColor.cgColor.components else {
            fatalError("保證選中的顏色是以RGB傳入")
        }
        
        guard let seconedComponent = seconedColor.cgColor.components else {
            fatalError("保證普通狀態的顏色是以RGB傳入")
        }
        
        let rDelta = firstComponent[0] * 255 - seconedComponent[0] * 255
        let gDelta = firstComponent[1] * 255 - seconedComponent[1] * 255
        let bDelta = firstComponent[2] * 255 - seconedComponent[2] * 255
        
        return (rDelta,gDelta,bDelta)
    }
    
    
    //獲取隨機顏色
    class func randomColor() -> UIColor {
        
        return UIColor(r:CGFloat(arc4random_uniform(256)),
                       g:CGFloat(arc4random_uniform(256)),
                       b:CGFloat(arc4random_uniform(256)))
    }
    
    
}
