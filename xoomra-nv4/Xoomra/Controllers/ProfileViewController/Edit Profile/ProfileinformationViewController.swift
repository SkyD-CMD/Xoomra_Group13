//
//  ProfileinformationViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 24/1/22.
//

import UIKit

class ProfileinformationViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gmail: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    
    // MARK: - Button Action.
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        let profile = UIStoryboard(name: "Main", bundle: nil)
        let vc = profile.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
