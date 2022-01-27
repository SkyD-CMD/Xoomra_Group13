//
//  EditProfileViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 24/1/22.
//

import UIKit

class EditProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var about: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        /// Call Privatre methods.
        setupUI()
        
    }
    
    // MARK: - Private Methods.
    private func setupUI(){
        saveButton.layer.cornerRadius = 5
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .dateAndTime
 
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        dob.inputAccessoryView = toolbar
        dob.inputView = datePicker
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm a"
        dob.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        // print out the image size as a test
        profileImageView.image = image
        print(image.size)
    }
    
    // MARK: - Button Action.
    @IBAction func changePhotoButtonAction(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        
    }
    
    

}
