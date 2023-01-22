//
//  PromotionV2.swift
//  buildhouseproject
//
//  Created by pooh on 1/1/2566 BE.
//

import SwiftUI

struct PromotionV2: View {
    // @ObservedObject var vm = ViewModel()
    @State var item: RenovateItem
    
    var body: some View {
        Button(action: {
        }, label: {
           NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage ))) {
                
                VStack { //vp
                    
                    Image(item.image)
                        .resizable()
                        .frame(width:210,height: 200)
                        .cornerRadius(20.0)
                    
                    HStack{
                        Image(item.company)
                            .resizable()
                        
                            .frame(width:40,height: 40)
                            .cornerRadius(50.0)
                            .padding(1)
                            .shadow(radius: 10)
                        VStack{
                            Text(item.name) //รูปบ้านใน landy home แต่งโดยเอา ห้องนอน หน้องน้ำใส่ในรูป
                                .font(.headline)
                                .fontWeight(.bold)
                            //.offset(x:-20)
                            Text("Start \(item.price) M")
                                .foregroundColor(Color.red)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                        }
                        Spacer()
                    }
                    
                } //vp
                .frame(width:210)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
                
            }
        })
        
        
    }
}
