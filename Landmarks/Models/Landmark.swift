//
//  Landmark.swift
//  Landmarks
//
//  Created by Chitralekha Yellewar on 09/08/20.
//  Copyright © 2020 Chitralekha Yellewar. All rights reserved.
//

import SwiftUI
import CoreLocation

/**
 
 "name": "Turtle Rock",
 "category": "Featured",
 "city": "Twentynine Palms",
 "state": "California",
 "id": 1001,
 "park": "Joshua Tree National Park",
 "coordinates": {
     "longitude": -116.166868,
     "latitude": 34.011286
 },
 "imageName": "turtlerock"
 */

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var coordinates: Coordinates
    var category: Category
    var city: String
    var state: String
    var park: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    enum Category: String, CaseIterable, Hashable, Codable {
        case featured = "Featured"
        case lake = "Lakes"
        case rivers = "Rivers"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var longitude: Double
    var latitude: Double
}

