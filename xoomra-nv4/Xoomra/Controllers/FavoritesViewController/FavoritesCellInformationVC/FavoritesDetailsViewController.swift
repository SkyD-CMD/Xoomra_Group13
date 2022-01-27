//
//  FavoritesDetailsViewController.swift
//  Xoomra
//
//  Created by Nur Rony on 25/1/22.
//

import UIKit

class FavoritesDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageVeiw: UIImageView!
    @IBOutlet weak var accommodationsName: UILabel!
    @IBOutlet weak var reting: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var booking: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Call Private methods.
        setupUI()
    }

    // MARK: - Private Methods.
    private func setupUI(){
        imageVeiw.layer.cornerRadius = 20
    }
    
    // MARK: - Button Action.
    

}
