//
//  iOS_FitFillTests.swift
//  iOS-FitFillTests
//
//  Created by IFang Lee on 2020/8/2.
//

import XCTest
import UIKit
@testable import iOS_FitFill

class MainViewControllerTest: XCTestCase {
    
    // MARK: - Constants
    static let mockOriginalImageSize = CGSize(width: 400, height: 300)
    static let targetImageViewSize = CGSize(width: 600, height: 800)
    static let expectedFitResizedSize = CGSize(width: 600, height: 450)
    
    var mainController: MainViewController!
    
    override func setUpWithError() throws {
        
        mainController = MainViewController.storyboardInit()
        mainController.loadViewIfNeeded()
        mainController.originalImage = UIImage.emptyImage(with: MainViewControllerTest.mockOriginalImageSize)
        mainController.imageViewCollection.forEach {
            $0.frame.size = MainViewControllerTest.targetImageViewSize
        }
    }
    
    func testScaleToFit() throws {
        
        mainController.scaleToFit()
        
        guard let scaleToFitSize = mainController.fitImageView.image?.size else {
            
            fatalError("Image should not be nil")
        }
        
        XCTAssertTrue(scaleToFitSize == MainViewControllerTest.expectedFitResizedSize)
    }
    
    func testScaleToFill() throws {
        
        mainController.scaleToFill()
        
        guard let scaleToFillSize = mainController.fillImageView.image?.size else {
            
            fatalError("Image should not be nil")
        }
        
        XCTAssertTrue(scaleToFillSize == MainViewControllerTest.targetImageViewSize)
    }
}
