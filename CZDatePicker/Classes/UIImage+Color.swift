//
//  UIImage+Color.swift
//  doctor
//
//  Created by guaker on 2020/11/26.
//  Copyright © 2020 digital. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
