//
//  Coordinates.swift
//  Xoomra
//
//  Created by Humaira Bodi on 2022-01-26.
//


import Foundation

class Coordinates{
    var longitute : Double
    var latitude : Double
    
    init(){
        self.latitude = 0.0
        self.longitute = 0.0
    }
    init(longitute: Double, latitude: Double){
        self.longitute = longitute
        self.latitude = latitude
    }
}
