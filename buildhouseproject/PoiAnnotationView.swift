//
//  PoiAnnotationView.swift
//  buildhouseproject
//
//  Created by pooh on 25/12/2565 BE.
//

import SwiftUI
struct PoiAnnotationView: View {
    let myPOI: PointOfInterest
    
    //ตัวแปรควบคุมการแสดง/ไม่แสดงปุ่ม PoiDetailView
    @State private var showPoiDetailView: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            
            HStack(spacing: 0){
                Text(myPOI.name)
                    .font(.callout)
                Button(action: {
                    self.showPoiDetailView.toggle()
                }){
                    Image(systemName: "info.square.fill")
                        .font(.system(size: 25))
                }
                .sheet(isPresented: $showPoiDetailView) {
                    PoiDetailView(myPOI: myPOI)
                        .presentationDetents([.fraction(0.25)])
                }
            }
            .background(Color(.white))
            .padding(5)
            .cornerRadius(10)
            
            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
        .foregroundColor(Color.black)
    }
}
struct PoiAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PoiAnnotationView(myPOI: PointOfInterest(name: "ชื่อสถานที่",
                                                 latitude: 0.0, longitude: 0.0))
    }
}
