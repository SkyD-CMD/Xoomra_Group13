//
//  SignUpViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 22/01/2022.
//

import UIKit
import TextFieldEffects
import Firebase
import CoreLocation

class SignUpViewController: UIViewController, CLLocationManagerDelegate {
    
    private var list = [Coordinates]()
   
    var mylati: Double = 0.0
    var mylong: Double = 0.0
    
    
    @IBOutlet weak var textFieldBackgroundView: UIView!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNoTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var locationManager: CLLocationManager?
    
    
    let datePicker = UIDatePicker()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation : CLLocationCoordinate2D = manager.location?.coordinate else{
            return
        }
        print("Current Location : lat : \(currentLocation.latitude) lng: \(currentLocation.longitude)")
        mylati = currentLocation.latitude
        mylong = currentLocation.longitude
        
        
//        print("Send this location to next screen which is \(mylati) and \(mylong)")
//        let newdata = Coordinates(longitute: mylong, latitude: mylati)
//        list.append(newdata)

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = true
        setupUI()
        initializeHideKeyboard()
        showDatePicker()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestWhenInUseAuthorization()
        
       

    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self){
                if CLLocationManager.isRangingAvailable(){
                    
                }
            }
        }
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
//        dobTextField.inputAccessoryView = toolbar
//        dobTextField.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm a"
        dobTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    // MARK: - Private Methods.
    func setupUI(){
        textFieldBackgroundView.layer.cornerRadius = 10
       // registerButton.layer.cornerRadius = 5
        
        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
    }
 
    // MARK: - Button Action.
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func btnRegisterPressed(_ sender: Any) {
        
        print("Register button is pressed")
        
        let name = fullNameTextField.text!
        let email = emailTextField.text!
        let phone = phoneNoTextField.text!
        let address = addressTextField.text!
        let pass = passwordTextField.text!
        let conpass = confirmPasswordTextField.text!
        
        
        if (name.isEmpty || email.isEmpty || phone.isEmpty || address.isEmpty || pass.isEmpty || conpass.isEmpty){
          let box1 = UIAlertController(title: "Fields are empty", message: "Please fill all fields", preferredStyle: .alert)
            box1.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                print("Button was pressed")
            }))
            box1.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                print("OK is pressed")
            }))
           self.present(box1, animated: true)
        }
        else if (pass != conpass){
            let box2 = UIAlertController(title: "Passwords do not match", message: "Please enter correct information", preferredStyle: .alert)
            box2.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
                print("Button was pressed")
            }))
            box2.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
                print("OK is pressed")
              
                self.passwordTextField.text = ""
                self.confirmPasswordTextField.text = ""
                
            }))
           self.present(box2, animated: true)
            
        }
        else{
            let db = Firestore.firestore()
            db.collection("NewRegister").addDocument(data:
                                                        ["Name" :"\(name)" ,"email" : "\(email)","Phone" : "\(phone)","Address" : "\(address)","Password":"\(pass)","Date": Date()])

        }

       
        
        print("Execuation happening ")
    }
    
}
