//
//  RenovateListView.swift
//  buildhouseproject
//
//  Created by pooh on 1/1/2566 BE.
//

import SwiftUI

struct RenovateListView: View {
    @State private var isShowing = false
    @Binding var query : String
    
    @ObservedObject var vmr = RenovateViewModel()
    
    @State var textinput : String
    var body: some View {
        NavigationView{
            ZStack{ //แสดง sidemenu
                Color(red: 0.80, green: 0.90, blue: 0.99)
                   .ignoresSafeArea()
                if isShowing{
                    SideMenuView(isShowing: $isShowing,query: $query,textinput: textinput)
                }
                //isShowing ? SideMenuView(isShowing:$isShowing)
                ZStack{
                    Color(red: 0.80, green: 0.90, blue: 0.99)
                        .ignoresSafeArea()
                
                    ScrollView(.vertical , showsIndicators: true)
                    {
                        VStack{ //hp
                            
                            Text("\(textinput) List")
                                .font(.headline)
                                .fontWeight(.semibold)
                                //.offset(y:-10)
                                                
                            ForEach(vmr.renovatefilteredItems) {item in
                                ExtractedView2(item: RenovateItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage))
                                
                                Spacer()
                            }
                            Spacer()
                            
                        } //hp
                        
                        .padding(.trailing)
                    }
                    .padding(.leading )
                
                    
                }
                .cornerRadius(isShowing ? 20 : 10)
                .offset(x: isShowing ? 150 :0 , y: isShowing ? 44:0)
                .scaleEffect(isShowing ? 0.9 : 1.0)
                
                .navigationBarItems(leading: Button(action: { withAnimation(.spring()) { isShowing.toggle() } }, label : {Image(systemName : "list.bullet")
                        .foregroundColor(.black)
                        
                }))
                //.navigationTitle("House List").font(.headline)

                if(isShowing==false){
                    withAnimation(.spring()){
                        HStack{
                            Button(action: {}, label : {
                                NavigationLink(destination:ContentView(textinput : " ").navigationBarHidden(true)){
                                Image(systemName: "house.circle")
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 35,height: 35)
                                        .frame(maxWidth:.infinity)
                                        .foregroundColor(Color.white)
                                }
                            })
                            Button(action: {}, label : {
                                NavigationLink(destination: SearchView(query: $query)){
                                    Image(systemName: "magnifyingglass.circle")
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 35,height: 35)
                                        .frame(maxWidth:.infinity)
                                        .foregroundColor(Color.white)
                                }
                            })
                            
                            Button(action: {}, label : {
                                
                                NavigationLink(destination: FavoriteListView()){                Image(systemName: "heart.circle")
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 35,height: 35)
                                        .frame(maxWidth:.infinity)
                                        .foregroundColor(Color.white)
                                }
                            })
                            
                            //popular
                            Button(action: {}, label : {
                             //   NavigationLink(destination: FavoriteListView()){
                                
                                Image(systemName: "info.circle")
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 35,height: 35)
                                        .frame(maxWidth:.infinity)
                                        .foregroundColor(Color.white)
                            //    }
                            })
                            
                            
                        }
                        .padding()
                        .background(Color(red: 0.41, green: 0.65, blue: 1.0))
                        .clipShape(Capsule())
                        .padding(.horizontal)
                        .shadow(color: Color.black.opacity(0.15),radius:8,x:2,y:6 )
                        .frame(maxHeight: .infinity , alignment: .bottom)
                        .padding(.leading)
                        .padding(.trailing)
                        //.offset(y:-100)
                    }}
            }
        }
    }
}

struct ExtractedView2: View {
    @State var item: RenovateItem
    var body: some View {
        Button(action: {
        }, label: {
            NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage ))) {
                
                VStack { //vp
                    // Image(uiImage: UIImage(named:imageName)!)
                    Image(item.image)
                        .resizable()
                        .frame(width:360,height: 200)
                        .cornerRadius(20.0)
                    //.padding(2)
                    HStack{
                        Image(item.company)
                            .resizable()
                        
                            .frame(width:40,height: 40)
                            .cornerRadius(50.0)
                            .padding(1)
                            .shadow(radius: 10)
                        VStack(alignment: .leading){
                            Text(item.name) //รูปบ้านใน landy home แต่งโดยเอา ห้องนอน หน้องน้ำใส่ในรูป
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            //.offset(x:-20)
                            Text("Start \(item.price) M")
                                .foregroundColor(Color.red)
                                .font(.callout)
                                .fontWeight(.medium)
                            
                        }
                        //.padding(.trailing,50)
                        //Spacer()
                        
                        HStack (spacing: 4) {
                            ForEach(0 ..< 5) { item in
                                //Image("star")
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .frame(width:10,height: 10)
                                    .padding(3)
                            }
                            Text("(4.9)")
                                .font(.body)
                                .opacity(0.5)
                                .padding(.leading, 8)
                            Spacer()
                        }
                        .padding(.leading,40)
                        
                    }
                    
                } //vp
                .frame(width:360)
                .padding(7)
                .background(Color.white)
                .cornerRadius(20.0)
                
            }
        })
    }
}
