//
//  UIImage.swift
//  iOS-FitFill
//
//  Created by IFang Lee on 2020/8/3.
//

import UIKit

extension UIImage {
    
    enum ScaleMode: String {
        
        case fit = "Scale to Fit"
        case fill = "Scale to Fill"
    }
    
    func resizeImage(to targetSize: CGSize, with mode: ScaleMode) -> UIImage? {

        var newSize: CGSize
        
        let widthRatio  = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        switch mode {
        case .fit:
            
            let ratio = widthRatio > heightRatio ? heightRatio : widthRatio
            newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        case .fill:
            newSize = targetSize
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
    
    static func emptyImage(with size: CGSize) -> UIImage? {
       
        UIGraphicsBeginImageContext(size)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
