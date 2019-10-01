//
//  ViewController.swift
//  iOS-ImagePicker-Lab
//
//  Created by Mr Wonderful on 10/1/19.
//  Copyright © 2019 Mr Wonderful. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var avatorImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       textField.delegate = self
        designAvatorImage()
    }

    private func designAvatorImage(){
        avatorImage.layer.cornerRadius = 125
        avatorImage.layer.borderWidth = 3
        avatorImage.layer.borderColor = UIColor.yellow.cgColor
        avatorImage.clipsToBounds = true
        avatorImage.isUserInteractionEnabled = true
    }
    @IBAction func addImageButtonPressed(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }

}
extension ImagePickerViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[.editedImage] as? UIImage{
            avatorImage.image = imageSelected
        }
        
        if let imageOriginal = info[.originalImage] as? UIImage{
            avatorImage.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ImagePickerViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let name = textField.text{
            nameLabel.text = name
           // UserDefaultWrapper.shared.store(name: name)
            textField.text = ""
        }
        return true
    }

    }

