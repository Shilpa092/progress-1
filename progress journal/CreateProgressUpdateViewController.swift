//
//  CreateProgressUpdateViewController.swift
//  progress journal
//
//  Created by Admin on 30/04/22.
//

import UIKit

class CreateProgressUpdateViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var pickercontroller = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        pickercontroller.delegate = self
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            photoImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func existingPhotoTapped(_ sender: Any) {
        pickercontroller.sourceType = .photoLibrary
        present(pickercontroller, animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: Any) {
        pickercontroller.sourceType = .photoLibrary
        present(pickercontroller, animated: true, completion: nil)
    }
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)? .persistentContainer.viewContext{
            let progressUpdateToSaved = ProgressUpdate(context: context)
            progressUpdateToSaved.title = titleTextField.text
            progressUpdateToSaved.image = photoImageView.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
    navigationController?.popViewController(animated: true)
    
    }

}
