//
//  ProfileOption.swift
//  Xoomra
//
//  Created by Nur Rony on 22/01/2022.
//

import Foundation
import UIKit

struct ProfileOption {
    
    var title: ProfileOptionTitle
    var image: UIImage
    
}

enum ProfileOptionTitle: String {
    case editProfile = "Edit Profile"
    case myListing = "My Listing"
    case termsAndConditions = "Terms and Condition"
    case logout = "Logout"
}
