//
//  CompanydetailView.swift
//  buildhouseproject
//
//  Created by pooh on 25/12/2565 BE.
//




import SwiftUI
import MapKit

struct  CompanydetailView: View {
    
    
    var body: some View {
        
        DescriptionView2()
        
        
    }
    
    
}


struct DescriptionView2: View {
    
    @State private var region = MKCoordinateRegion(center:
                                                    CLLocationCoordinate2D( latitude: 13.7563, longitude: 100.5018), span:
                                                    MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    private let myPOIs = [
        PointOfInterest(name: "Landy Home สาขาที่ 1", latitude:
                            13.7263851, longitude: 100.5086877),
        PointOfInterest(name: "Landy Home สาขาที่ 2", latitude:
                            13.7460778, longitude: 100.5360801),
        PointOfInterest(name: "Landy Home สาขาที่ 3", latitude:
                            13.7233652, longitude: 100.5260607),
        PointOfInterest(name: "Landy Home สาขาที่ 4", latitude: 13.7314058,
                        longitude: 100.5392509)
    ]
    
    var body: some View {
        ZStack{ //z
            Color(red: 0.80, green: 0.90, blue: 0.99)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                
                
                VStack{
                    
                    Image("LH")
                        .resizable()
                        .frame(width: .infinity ,height: 200)
                    
                    
                    
                    
                    VStack {
                        
                        
                        Image("Landy")
                            .resizable()
                            .frame(width:70,height: 70)
                            .cornerRadius(50.0)
                            .padding(1)
                            .shadow(radius: 10)
                            .offset(y:-40)
                        Text("landy home (thailand) co. ltd")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                        //.padding(.leading,50)
                            .offset(y:-50)
                            .foregroundColor(Color.blue)
                    }
                    
                    VStack(alignment: .leading){
                        
                        Text("ประเภทธุรกิจ")
                        
                            .fontWeight(.semibold)
                            .offset(y:-55)
                        VStack { //vp
                            
                            Text("ศูนย์รับสร้างบ้าน อันดับ 1 ของประเทศไทยมั่นคงด้วยทุนจดทะเบียน 200 ล้านบาท ได้รับการรับรองคุณภาพมาตรฐาน ISO 9001:2015 พร้อมเป็นผู้นำด้าน การออกแบบและ เทคโนโลยีการอยู่อาศัย")
                                .font(.body)
                                .fontWeight(.ultraLight)
                            //.offset(x:-20)
                            
                            
                            
                        } //vp
                        .frame(width:325)
                        .padding()
                        
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .offset(y:-55)
                        .padding(.bottom,5)
                        
                        Text("สำนักงานใหญ่")
                        
                            .fontWeight(.semibold)
                            .offset(y:-55)
                        VStack { //vp
                            
                            Text("เลขที่ 1 อาคารเก้าพูลทรัพย์ ชั้น 3,8 ซอยลาดพร้าว 19 ถนนลาดพร้าว แขวงจอมพล เขตจตุจักร กทม 10900")
                                .font(.body)
                                .fontWeight(.ultraLight)
                            //.offset(x:-20)
                            
                            
                            
                        } //vp
                        .frame(width:330)
                        .padding(10)
                        
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .offset(y:-55)
                        
                        
                        Text("ที่ตั้งสาขา")
                            .fontWeight(.semibold)
                        
                            .padding(5)
                            .offset(y:-55)
                        
                        Map(coordinateRegion: $region, annotationItems: myPOIs){ myPOI in
                            MapAnnotation(coordinate: myPOI.coordinate) {
                                PoiAnnotationView(myPOI: myPOI)
                            }
                        }
                        .frame(width: 355,height: 200)
                        .cornerRadius(10.0)        .offset(y:-55)
                        
                        Text("ติดต่อ")
                            .fontWeight(.semibold)
                        
                            .padding(5)
                            .offset(y:-55)
                        VStack(alignment: .leading) { //vp
                            
                            Text("เบอร์ติดต่อ โทร : 02-938-34567, 081-358-4242 ")
                                .font(.body)
                                .fontWeight(.regular)
                                .offset(x:-40)
                                .padding(.bottom,5)
                            HStack{
                                Text("เว็บไซต์  :")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .offset(x:-40)
                                Link(destination: URL(string: "https://www.landyhome.co.th")!, label:{
                                    
                                    Text(" www.landyhome.co.th ")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .offset(x:-42)
                                })
                            }
                            .padding(.bottom,5)
                            HStack{
                                /*Text("เว็บไซต์  :")
                                 .font(.body)
                                 .fontWeight(.regular)
                                 .offset(x:-40)*/
                                Image("fb")
                                    .resizable()
                                    .frame(width:40,height: 40)
                                    .cornerRadius(10.0)
                                    .padding(1)
                                    .shadow(radius: 10)
                                    .offset(x:-40)
                                
                                
                                Link(destination: URL(string: "https://www.landyhome.co.th")!, label:{
                                    
                                    Text(" : Landy Home")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .offset(x:-42)
                                })
                            }
                        } //vp
                        .frame(width:330)
                        .padding(10)
                        
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .offset(y:-55)
                        
                    }
                    
                    
                    
                    
                    
                }
                
                
            }
            
            
            
            
        }
        
    }
    
}
struct CompanydetailView_Previews: PreviewProvider {
    static var previews: some View {
        CompanydetailView()
    }
}
