//
//  TableViewCell.swift
//  Xoomra
//
//  Created by Nur Rony on 24/1/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageVeiw: UIImageView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nightPrize: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var favoritesOnOff = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// Call Private function.
        setupCellUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    // MARK: - Private Methods.
    private func setupCellUI(){
        imageVeiw.layer.cornerRadius = 10
        
    }
    
    // MARK: - Button Action.
    @IBAction func favoriteButtonAction(_ sender: UIButton){
        if favoritesOnOff{
            favoriteImageView.image = UIImage(named: "favorites-tabbar")
            favoritesOnOff = false
        }else{
            favoriteImageView.image = UIImage(named: "favorites")
            favoritesOnOff = true
        }
    }
    
    
    func configureCell(listofacc: Accommodation) {
        name.text = listofacc.aname
        cityName.text = listofacc.City
//        Available_Rooms.text = "\(listofacc.availableRooms)"
        
        
        
        
    }
    
    
}
