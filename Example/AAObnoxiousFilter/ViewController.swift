//
//  ViewController.swift
//  AAObnoxiousFilter
//
//  Created by EngrAhsanAli on 02/25/2019.
//  Copyright (c) 2019 EngrAhsanAli. All rights reserved.
//

import UIKit
import AAObnoxiousFilter

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - IBActions
extension ViewController {
    
    @IBAction func pickImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .savedPhotosAlbum
        present(pickerController, animated: true)
    }
    
    func detectPhoto(image: UIImage) {
        answerLabel.text = "predicting..."
        answerLabel.textAlignment = .center
        
        if let prediction = image.predictImage() {
            self.answerLabel.text = String(format: "%.6f", prediction)
        }
        else {
            self.answerLabel.text = "Something went wrong with the provided image"
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Can not load image from Photos")
        }
        
        photo.image = image
        detectPhoto(image: image)
        
    }
    
    
}

// MARK: - UINavigationControllerDelegate
extension ViewController: UINavigationControllerDelegate {
}
