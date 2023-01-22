//
//  PoiDetailView.swift
//  buildhouseproject
//
//  Created by pooh on 25/12/2565 BE.
//

import SwiftUI
struct PoiDetailView: View {
    let myPOI : PointOfInterest
    var body: some View {
        VStack(spacing: 0){
            Text("\(myPOI.name)")
                .font(.title)
                .fontWeight(.bold)
            Text("(\(myPOI.latitude) , \(myPOI.longitude))")
        }
        .foregroundColor(Color.black)
    }
}

struct PoiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PoiDetailView(myPOI: PointOfInterest(name: "MyOffice", latitude:
                                                0.00000, longitude: 0.0000))
    }
}
