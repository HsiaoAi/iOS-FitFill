//
//  UIStoryboard.swift
//  iOS-FitFill
//
//  Created by IFang Lee on 2020/8/2.
//

import UIKit

public protocol StoryboardInit { }

public extension StoryboardInit where Self: UIViewController {
    
    // MARK: - Storyboard Init
    
    static func storyboardInit() -> Self {
        
        return UIStoryboard(name: String(describing: self), bundle: Bundle(for: self)).instantiateInitialViewController() as! Self
    }
}
