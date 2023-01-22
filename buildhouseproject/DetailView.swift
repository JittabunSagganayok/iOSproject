//
//  DetailView.swift
//  buildhouseproject
//
//  Created by pooh on 14/11/2565 BE.
//

//copy from MyOrderView.swift

import SwiftUI


struct DetailView: View {
    
    
    var item: ALLItem
    
    
    
    @ObservedObject var vm = HouseViewModel()
    var body: some View {
        
        DescriptionView(item: item)
       
        
    }
    
    
}


struct DescriptionView: View {
    @ObservedObject var vm = ALLViewModel()
    
    var item: ALLItem
    @State var showpic1 = false
    @State var showpic2 = false
    @State var showpic3 = false
    @State var showpic4 = false
    @State var showpic5 = false
    @State var showpic6 = false
    
    @State private var showAcitivityVC: Bool = false
    @State private var showreserve: Bool = false
    
    @State private var resultMessage : String = ""
    
    var body: some View {
        ZStack{ //z
            Color(red: 0.80, green: 0.90, blue: 0.99)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                
                
                VStack{
                    // Title
                    Image(item.image) //
                        .resizable()
                        .frame(width: .infinity ,height: 300)
                        .cornerRadius(30)
                    
                    
                    VStack (alignment: .leading) {
                        
                        HStack{
                            
                            Text(item.name)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: vm.contains(item) ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.red)
                                .onTapGesture {
                                    vm.toggleFav(item: item)
                                }
                                .padding(.trailing)
                            Button(action: {
                                self.showAcitivityVC.toggle()
                            }){
                                Image(systemName: "square.and.arrow.up.circle.fill" )
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                            }
                        }
                        Text("Company : \(item.company)")
                        
                            .fontWeight(.medium)
                            .offset(y:-5)
                        
                        
                        //                Rating
                        HStack (spacing: 4) {
                            ForEach(0 ..< 5) { item in
                                //Image("star")
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            Text("(4.9)")
                                .opacity(0.5)
                                .padding(.leading, 8)
                            Spacer()
                        }
                        
                        HStack{
                            Button(action: { showpic1.toggle() }, label: {
                                
                                VStack { //vp
                                    
                                    Image("in1")
                                        .resizable()
                                        .frame(width:80,height: 70)
                                        .cornerRadius(20.0)
                                } //vp
                                .cornerRadius(20.0)
                                
                                
                                
                                //     }
                            })
                            
                            
                            Button(action: {showpic2.toggle()}, label: {
                                
                                
                                VStack { //vp
                                    
                                    Image("in2")
                                        .resizable()
                                        .frame(width:80,height: 70)
                                        .cornerRadius(20.0)
                                } //vp
                                .cornerRadius(20.0)
                                
                                
                            })
                            
                            
                            Button(action: {showpic3.toggle()}, label: {
                                
                                
                                VStack { //vp
                                    
                                    Image("in3")
                                        .resizable()
                                        .frame(width:80,height: 70)
                                        .cornerRadius(20.0)
                                } //vp
                                .cornerRadius(20.0)
                                
                                
                            })
                            
                            
                            Button(action: {showpic4.toggle()}, label: {
                                //  NavigationLink(destination: test() ) {
                                
                                VStack { //vp
                                    
                                    Image("in4")
                                        .resizable()
                                        .frame(width:80,height: 70)
                                        .cornerRadius(20.0)
                                } //vp
                                .cornerRadius(20.0)
                                
                                //     }
                            })
                            
                        }
                        
                        
                        
                        Text("Description")
                            .fontWeight(.medium)
                        
                            .padding(1)
                        
                        Text(item.description)
                            .lineSpacing(3.0)
                            .opacity(0.6)
                        
                        //                Info
                        HStack (alignment: .top) {
                            VStack (alignment: .leading) {
                                Text("Size")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                Text("ขนาดอาคาร : 13.00 X 14.00 ม.")
                                    .opacity(0.6)
                                Text("ขนาดที่ดิน : 17.00 X 18.00 ม. (77.0 ตร.ว.)")
                                    .opacity(0.6)
                                Text("พื้นที่ใช้สอย : 460.00 ตร.ม.")
                                    .opacity(0.6)
                            }
                            
                            
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                            
                            
                        }
                        .padding(.vertical)
                        
                        Text("Floor Plan")
                            .fontWeight(.medium)
                        
                        HStack{
                            Button(action: {showpic5.toggle() }, label: {
                                //     NavigationLink(destination: test() ) {
                                
                                VStack { //vp
                                    
                                    Image("1.1")
                                        .resizable()
                                        .frame(width:150,height: 140)
                                        .cornerRadius(20.0)
                                } //vp
                                .cornerRadius(20.0)
                                
                                //    }
                            })
                            Button(action: {showpic6.toggle() /*item.name=Comment*/  }, label: {
                                //     NavigationLink(destination: test() ) {
                                
                                VStack { //vp
                                    
                                    Image("1.2")
                                        .resizable()
                                        .frame(width:150,height: 140)
                                        .cornerRadius(20.0)
                                } //vp
                                .cornerRadius(20.0)
                                
                                //    }
                            })
                            
                            
                            
                        }
                        .padding(.bottom,10)
                        
                         
                        
                        VStack(alignment: .leading){
                            Text("Video Review")
                                .fontWeight(.medium)
                            
                            
                            VideoView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage ))
                        }
                        
                        
                    }
                    
                    .padding()
                    
                    .background(Color.white)
                  
                    
                    .offset(x: 0, y: -30.0)
                    
                    
                    
                    
                    
                }
                
                
                
                
            }
            .sheet(isPresented: $showAcitivityVC) {
                ActivityView(resultMessage: $resultMessage, showActivityVC:
                                $showAcitivityVC, activityItems: [item.image]).presentationDetents([.medium,.large])
            }
            .sheet(isPresented: $showreserve) {
                Reserveinput().presentationDetents([.medium,.large])
            }
            
            
            HStack {
                Image(item.company)
                    .resizable()
                
                    .frame(width:40,height: 40)
                    .cornerRadius(50.0)
                    .padding(1)
                    .shadow(radius: 10)
                
                Text("Price \(item.price) M")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Spacer()
                
                
                
                Button(action: { showreserve.toggle()    },label :{
                    
                    Text("Reserve")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.blue)
                        .padding(5)
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .cornerRadius(10.0)
                    
                    
                })
                
                
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color.blue)
            .cornerRadius(60.0)
            .frame(maxHeight:.infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .overlay(
            
            ZStack(alignment: .top)
            {
                
                if(showpic1){
                    
                    Image("in1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,height: 300)
                        .offset(y:-50)
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .background(
                            Color.black
                                .opacity(0.8)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    showpic1.toggle()
                                })
                }
                else if(showpic2){
                    
                    Image("in2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,height: 300)
                        .offset(y:-50)
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .background(
                            Color.black
                                .opacity(0.8)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    showpic2.toggle()
                                })
                }
                
                else if(showpic3){
                    
                    Image("in3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,height: 300)
                        .offset(y:-50)
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .background(
                            Color.black
                                .opacity(0.8)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    showpic3.toggle()
                                })
                }
                else if(showpic4){
                    
                    Image("in4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,height: 300)
                        .offset(y:-50)
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .background(
                            Color.black
                                .opacity(0.8)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    showpic4.toggle()
                                })
                }
                
                else if(showpic5){
                    
                    Image("1.1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,height: 300)
                    
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .background(
                            Color.black
                                .opacity(0.8)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    showpic5.toggle()
                                })
                }
                
                else if(showpic6){
                    
                    Image("1.2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300,height: 300)
                    
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .background(
                            Color.black
                                .opacity(0.8)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    showpic6.toggle()
                                })
                }
                
            }
            
        )
        
        
        
    }
    
}




