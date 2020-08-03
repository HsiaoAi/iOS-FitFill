//
//  ViewController.swift
//  iOS-FitFill
//
//  Created by IFang Lee on 2020/8/2.
//

import UIKit

class MainViewController: UIViewController, StoryboardInit {
    
    // MARK: - Constants
    
    static let sizeInfoFormat = "%@\n\nWidth: %@\nHeight: %@"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var selectPictureButton: UIButton!
    @IBOutlet weak var originalImageView: UIImageView!
    @IBOutlet weak var originalImageInfoLabel: UILabel!
    @IBOutlet weak var fitImageView: UIImageView!
    @IBOutlet weak var fitImageInfoLabel: UILabel!
    @IBOutlet weak var fillImageView: UIImageView!
    @IBOutlet weak var fillImageInfoLabel: UILabel!
    @IBOutlet var imageViewCollection: [UIImageView]!
    
    // MARK: - Properties
    
    var originalImage: UIImage? {
        
        didSet {
            
            originalImageView.image = originalImage
            
            guard let size = originalImage?.size else { return }
            originalImageInfoLabel.text = String(
                format: MainViewController.sizeInfoFormat,
                arguments: ["Original", "\(size.width)", "\(size.height)"]
            )
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        setupUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    // MARK: - Actions
    
    @IBAction func didTouchUpInsideSelectPicture(_ sender: Any) {
        
        presentImagePickerController()
    }
}

// MARK: - Scale Functions
extension MainViewController {
    
    func scaleToFit() {
        
        guard let originalImage = originalImage else {
            
            handleNoOriginalImageError()
            
            return
        }
       
        if let fitImage = originalImage.resizeImage(to: fitImageView.frame.size, with: .fit) {
            fitImageView.image = fitImage
            fitImageInfoLabel.text = createSizeInfo(for: fitImage, with: .fit)
        }
    }
    
    func scaleToFill() {
        
        guard let originalImage = originalImage else {
            
            handleNoOriginalImageError()
            
            return
        }
        
        if let fillImage = originalImage.resizeImage(to: fillImageView.frame.size, with: .fill) {
            fillImageView.image = fillImage
            fillImageInfoLabel.text = createSizeInfo(for: fillImage, with: .fill)
        }
    }
}

// MARK: - Helper Functions
private extension MainViewController {
    
    func setupUI() {
        
        originalImageInfoLabel.text = "Original"
        
        imageViewCollection.forEach(setup)
        resetResizedImageViews()
        
        setupSelectPictureButton()
    }
    
    func setup(_ imageView: UIImageView) {
        
        imageView.layer.borderColor = UIColor.systemYellow.cgColor
    }
    
    func setupSelectPictureButton() {
        
        selectPictureButton.layer.borderWidth = 2
        selectPictureButton.layer.borderColor = selectPictureButton.currentTitleColor.cgColor
        selectPictureButton.layer.cornerRadius = 5.0
    }
    
    func presentImagePickerController() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func resizeImage() {
        
        scaleToFit()
        scaleToFill()
    }
    
    func resetResizedImageViews() {
        fitImageView.image = nil
        fitImageInfoLabel.text = UIImage.ScaleMode.fit.rawValue
        fillImageView.image = nil
        fillImageInfoLabel.text = UIImage.ScaleMode.fill.rawValue
    }
    
    func createSizeInfo(for image: UIImage, with mode: UIImage.ScaleMode) -> String {
        
        String(
            format: MainViewController.sizeInfoFormat,
            arguments: [mode.rawValue, "\(image.size.width)", "\(image.size.height)"]
        )
    }
    
    func handleNoOriginalImageError() {
        
        let alertController = UIAlertController(
             title: "Oops",
             message: "Please select picture first.",
             preferredStyle: .alert
         )
        
         present(alertController, animated: true) { [weak self] in
             
             self?.resetResizedImageViews()
         }
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension MainViewController: (UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else { return }
        originalImage = image
        resizeImage()
        dismiss(animated: true, completion: nil)
    }
}
