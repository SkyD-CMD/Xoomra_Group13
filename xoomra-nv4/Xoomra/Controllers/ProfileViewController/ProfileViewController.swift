//
//  ProfileViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 24/1/22.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Button Action.
    @IBAction func profileButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let profile = UIStoryboard(name: "Main", bundle: nil)
            let vc = profile.instantiateViewController(withIdentifier: "ProfileinformationViewController") as! ProfileinformationViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let profile = UIStoryboard(name: "Main", bundle: nil)
            let vc = profile.instantiateViewController(withIdentifier: "ProfileinformationViewController") as! ProfileinformationViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let profile = UIStoryboard(name: "Main", bundle: nil)
            let vc = profile.instantiateViewController(withIdentifier: "ProfileinformationViewController") as! ProfileinformationViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            let profile = UIStoryboard(name: "Main", bundle: nil)
            let vc = profile.instantiateViewController(withIdentifier: "ProfileinformationViewController") as! ProfileinformationViewController
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
    
    

}
