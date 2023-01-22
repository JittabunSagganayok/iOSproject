//
//  PointOfInterest.swift
//  buildhouseproject
//
//  Created by pooh on 25/12/2565 BE.
//

import MapKit
struct PointOfInterest: Identifiable {
    //กําหนดตัวแปรที่จะใช้เก็บข้อมูลสถานที่น่าสนใจ
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
