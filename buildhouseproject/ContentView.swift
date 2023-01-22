//
//  ContentView.swift
//  buildhouseproject
//
//  Created by pooh on 8/11/2565 BE.
//

import SwiftUI

struct ContentView: View{
    
    
    @ObservedObject var vm = HouseViewModel()
    @ObservedObject var vmr = RenovateViewModel()
    
    @State var query = ""
    @State var isShowing = false //คุมเปิดปิด sidebar
    @State var showsearch = false //แสดงหน้า search
    @State var isActive = 0 //คุมหน้าใน sidebar
    
    @State var textinput : String
    
    var body: some View {
        NavigationView{
            ZStack{ //แสดง sidemenu
                Color(red: 0.80, green: 0.90, blue: 0.99)
                    .ignoresSafeArea()
                
                
                if isShowing{
                    SideMenuView(isShowing: $isShowing,query:$query,textinput:" ")
                }
                    VStack{
                      HStack{
                            VStack{ //v1
                                Text(" Find The \n Best ")
                                    .font(.system(size: 24))
                                    .foregroundColor(Color.black)
                                + Text("House !")
                                    .font(.system(size: 28,weight:.semibold))
                                    .foregroundColor(Color(red: 0.98, green: 0.38, blue: 0.22))
                                
                            }
                            .padding()
                            Spacer()
                            
                        }
                        HStack{//Hsearch
                            TextField("Search...",text: $query)
                                
                            NavigationLink(destination: SearchView(query: $query) ) {
                                
                                Image(systemName: "magnifyingglass.circle.fill")
                                    
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(Color.blue).padding(.trailing,8)
                                
                                
                            }
                            
                            // ใช้ .fullscreencover และหาวิธีปิด กด back
                            /*       .sheet(isPresented: $showsearch) {
                             SearchView(query: $query)
                             }
                             */
                        } //H1seacrch
                        
                        .padding()
                        /*.background(Color(red: 0.90, green: 0.99, blue: 0.99))*/
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .padding(.horizontal,20)
                        .padding(.bottom,5)
                        
                        //                       ScrollView(.vertical , showsIndicators: false){                        // .padding(.top,-560)
                        HStack{ //H2
                            Button(action: { isActive=0
                            }) {
                                if(isActive != 0){                      Text("House")
                                        .padding(.all,7)
                                        .font(.system(size:17))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black.opacity(0.5))
                                }
                                else{
                                    Text("House")
                                        .padding(.all,7)
                                        .font(.system(size:17))
                                        .fontWeight(.medium)
                                        .overlay(RoundedRectangle(cornerRadius: 50.0)
                                            .stroke(lineWidth: 2.0)
                                            .fill(Color.blue))
                                }
                            }
                            
                            /*.sheet(isPresented: $isActive=0) {
                             SearchView()
                             }*/
                            
                            
                            Button(action: { isActive=1
                            }) {
                                if(isActive == 1){                                       Text("Renovate")
                                        .padding(.all,7)
                                        .font(.system(size:17))
                                        .fontWeight(.medium)
                                        .overlay(RoundedRectangle(cornerRadius: 50.0)
                                            .stroke(lineWidth: 2.0)
                                            .fill(Color.blue))
                                }
                                else {
                                    Text("Renovate")
                                        .padding(.all,7)
                                        .font(.system(size:17))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black.opacity(0.5))
                                    
                                }
                            }
                            Button(action: { isActive=2
                            }) {
                                if(isActive == 2){
                                    Text("Interior")
                                        .padding(.all,7)
                                        .font(.system(size:17))
                                        .fontWeight(.medium)
                                        .overlay(RoundedRectangle(cornerRadius: 50.0)
                                            .stroke(lineWidth: 2.0)
                                            .fill(Color.blue))
                                }
                                else {
                                    Text("Interior")
                                        .padding(.all,7)
                                        .font(.system(size:17))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black.opacity(0.5))
                                    
                                }
                            }
                            
                            Button(action: { isActive=3
                            }) {
                                if(isActive == 3){
                                    Text("Knockdown")
                                        .padding(.all,7)
                                        .font(.system(size:16))
                                        .fontWeight(.medium)
                                        .overlay(RoundedRectangle(cornerRadius: 50.0)
                                            .stroke(lineWidth: 2.0)
                                            .fill(Color.blue))
                                }
                                else {
                                    Text("Knockdown")
                                        .padding(.all,7)
                                        .font(.system(size:16))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black.opacity(0.5))
                                    
                                }
                            }
                            
                        }
                        //.padding()
                        Spacer()
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                            
                            if(isActive == 0){
                                
                                VStack(alignment: .leading ){
                                    Text("Promotion")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)
                                    
                                    
                                    ScrollView(.horizontal , showsIndicators: false)
                                    {
                                        HStack{ //hp
                                            
                                            ForEach(vm.housefilteredItems) {item in
                                                Promotion(item: item)
                                                
                                            }
                                            
                                        } //hp
                                        
                                        .padding(.trailing)
                                    }
                                    .padding(.leading )
                                    
                                    Text("Popular")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)                                    //  ScrollView(.vertical , showsIndicators: false)
                                    //     {
                                    ForEach(vm.housefilteredItems) { item in
                                        NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage  ))) {
                                            HStack {
                                                VStack {
                                                    Image(item.image)
                                                        .resizable()
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                        .frame(width: 150.0, height: 100.0)
                                                        .padding(1)
                                                    //.background(Color.blue)
                                                    //.clipShape(RoundedRectangle(cornerRadius: 12))
                                                    
                                                }
                                                
                                                
                                                VStack(alignment: .leading) {
                                                    Text(item.name)
                                                        .font(.headline)
                                                    
                                                    
                                                    Text("Price : \(item.price) M")
                                                        .foregroundColor(Color.black.opacity(0.8))
                                                        .font(.subheadline)
                                                    Text("By \(item.company)")
                                                        .foregroundColor(Color.black.opacity(0.8))                   .font(.subheadline)
                                                }
                                                Spacer()
                                                
                                            }
                                        }
                                                                                             .padding()
                                                                                             .background(Color.white)
                                                                                             .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    
                                }
                                
                            }
                            
                            if(isActive == 1){
                                
                                VStack(alignment: .leading ){
                                    Text("Promotion")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)
                                    ScrollView(.horizontal , showsIndicators: false)
                                    {
                                        HStack{ //hp
                                            
                                            ForEach(vmr.renovatefilteredItems) {item in
                                                PromotionV2(item: item)
                                                
                                            }
                                            
                                        } //hp
                                        
                                        .padding(.trailing)
                                    }
                                    .padding(.leading )
                                    
                                    Text("Popular")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)                                    //  ScrollView(.vertical , showsIndicators: false)
                                    //     {
                                    ForEach(vmr.renovatefilteredItems) { item in
                                        NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage  ))) {
                                            HStack {
                                                VStack {
                                                    Image(item.image)
                                                        .resizable()
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                        .frame(width: 150.0, height: 100.0)
                                                        .padding(1)
                                                    //.background(Color.blue)
                                                    //.clipShape(RoundedRectangle(cornerRadius: 12))
                                                    
                                                }
                                                
                                                
                                                VStack(alignment: .leading) {
                                                    Text(item.name)
                                                        .font(.headline)
                                                    
                                                    
                                                    Text("Price : \(item.price) M")
                                                        .foregroundColor(Color.black.opacity(0.8))
                                                        .font(.subheadline)
                                                    Text("By \(item.company)")
                                                        .foregroundColor(Color.black.opacity(0.8))                   .font(.subheadline)
                                                }
                                                Spacer()
                                                
                                            }
                                        }
                                                                                             .padding()
                                                                                             .background(Color.white)
                                                                                             .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    
                                }
                                
                            }
                            
                            if(isActive == 2){
                                
                                VStack(alignment: .leading ){
                                    Text("Promotion")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)
                                    ScrollView(.horizontal , showsIndicators: false)
                                    {
                                        HStack{ //hp
                                            
                                            ForEach(vm.housefilteredItems) {item in
                                                Promotion(item: item)
                                                
                                            }
                                            
                                        } //hp
                                        
                                        .padding(.trailing)
                                    }
                                    .padding(.leading )
                                    
                                    Text("Popular")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)                                    //  ScrollView(.vertical , showsIndicators: false)
                                    //     {
                                    ForEach(vm.housefilteredItems) { item in
                                        NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage  ))) {
                                            HStack {
                                                VStack {
                                                    Image(item.image)
                                                        .resizable()
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                        .frame(width: 150.0, height: 100.0)
                                                        .padding(1)
                                                    //.background(Color.blue)
                                                    //.clipShape(RoundedRectangle(cornerRadius: 12))
                                                    
                                                }
                                                
                                                
                                                VStack(alignment: .leading) {
                                                    Text(item.name)
                                                        .font(.headline)
                                                    
                                                    
                                                    Text("Price : \(item.price) M")
                                                        .foregroundColor(Color.black.opacity(0.8))
                                                        .font(.subheadline)
                                                    Text("By \(item.company)")
                                                        .foregroundColor(Color.black.opacity(0.8))                   .font(.subheadline)
                                                }
                                                Spacer()
                                                
                                            }
                                        }
                                                                                             .padding()
                                                                                             .background(Color.white)
                                                                                             .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    
                                }
                                
                            }
                            
                            if(isActive == 3){
                                
                                VStack(alignment: .leading ){
                                    Text("Promotion")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)
                                    ScrollView(.horizontal , showsIndicators: false)
                                    {
                                        HStack{ //hp
                                            
                                            ForEach(vmr.renovatefilteredItems) {item in
                                                PromotionV2(item: item)
                                                
                                            }
                                            
                                        } //hp
                                        
                                        .padding(.trailing)
                                    }
                                    .padding(.leading )
                                    
                                    Text("Popular")
                                        .font(.headline)
                                        .padding(.leading,20)
                                        .foregroundColor(Color.black)                                    //  ScrollView(.vertical , showsIndicators: false)
                                    //     {
                                    ForEach(vmr.renovatefilteredItems) { item in
                                        NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage  ))) {
                                            HStack {
                                                VStack {
                                                    Image(item.image)
                                                        .resizable()
                                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                                        .frame(width: 150.0, height: 100.0)
                                                        .padding(1)
                                                    //.background(Color.blue)
                                                    //.clipShape(RoundedRectangle(cornerRadius: 12))
                                                    
                                                }
                                                
                                                
                                                VStack(alignment: .leading) {
                                                    Text(item.name)
                                                        .font(.headline)
                                                    
                                                    
                                                    Text("Price : \(item.price) M")
                                                        .foregroundColor(Color.black.opacity(0.8))
                                                        .font(.subheadline)
                                                    Text("By \(item.company)")
                                                        .foregroundColor(Color.black.opacity(0.8))                   .font(.subheadline)
                                                }
                                                Spacer()
                                                
                                            }
                                        }
                                                                                             .padding()
                                                                                             .background(Color.white)
                                                                                             .clipShape(RoundedRectangle(cornerRadius: 12))
                                        
                                    }
                                    .padding(.leading)
                                    .padding(.trailing)
                                    
                                }
                                
                            }                         }
                        
                        
                    }
                    
                    
                
                .foregroundColor(Color.blue)
                .cornerRadius(isShowing ? 20 : 10)
                .offset(x: isShowing ? 150 :0 , y: isShowing ? 44:0)
                .scaleEffect(isShowing ? 0.9 : 1.0)
                
                .navigationBarItems(leading: Button(action: { withAnimation(.spring()) { isShowing.toggle() } }, label : {Image(systemName : "list.bullet")
                        .foregroundColor(.black)
                    
                }))
                //.navigationTitle("Home test")
                if(isShowing==false){
                    withAnimation(.spring()){
                        bottommenu(query: $query)
                        //.offset(y:-100)
                    }}
                // }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(textinput: " ")
    }
}
struct bottommenu: View {
    @Binding var query : String
    var body: some View {
        HStack{
            Button(action: {}, label : {
                NavigationLink(destination:ContentView(textinput: " ").navigationBarHidden(true)){
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
                
                NavigationLink(destination: FavoriteListView()){
                    Image(systemName: "heart.circle")
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
        
    }
}
