//
//  Accommodation.swift
//  Xoomra
//
//  Created by Humaira Bodi on 2022-01-26.
//

import Foundation



class Accommodation{
    var aname: String
    var availableRooms: Int
    var City: String
    
    init(){
        self.aname = "none"
        self.availableRooms = 0
        self.City = "none"
    }
    init(aname: String, availableRooms: Int, City: String){
        self.aname = aname
        self.availableRooms = availableRooms
        self.City = City
    }
}
