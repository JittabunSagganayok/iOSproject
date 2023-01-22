//
//  SideMenuView.swift
//  buildhouseproject
//
//  Created by pooh on 8/11/2565 BE.
//


// Side Menu

//ทำ sub view ได้

import SwiftUI

struct SideMenuView: View{
    
    //let persistenceController = PersistenceController.shared
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Binding var isShowing: Bool
    @State var showtest = false
    @Binding var query : String
    @State var pageActive = 0 //check หน้าไหนเปิดอยู่
    
    @State var Reserveshowing = false
    
    @State var textinput : String
    
    var body: some View {
        // NavigationView{
        ZStack{
            LinearGradient(gradient: Gradient(colors:[Color.blue,Color.purple]),startPoint:.top , endPoint:.bottom)
                .ignoresSafeArea()
            
            VStack{
                
                
                VStack(){
                    
                    HStack{
                        Image( "cat")
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width:64,height:64)
                            .clipShape(Circle())
                            .padding(.bottom,10)
                            .padding(.leading,40)
                            .padding(.top,50)
                        // .padding(.trailing,100)
                        //.padding(.horizontal,200)
                        
                            .frame(width:150,height:5)
                        //.background(Color.white)
                        
                        
                        Button(action: {withAnimation(.spring()) { isShowing.toggle() }},label :{
                            
                            Image(systemName:"xmark")
                            
                                .frame(width:32,height:32)
                                .foregroundColor(.white)
                            //.padding(.leading,220)
                            
                            
                            //Text(" sadasd ")
                            
                        })
                        .offset(y:30)
                    }
                    
                    .padding(.bottom,30)
                    
                    Text("Guest")
                        .font(.system(size: 20,weight:.semibold))
                    //.padding()
                    Text("Status : Verified")
                        .font(.system(size: 16))
                        .padding(.leading)
                    
                    
                }
                .offset(x:-130)
                Spacer()
                    .foregroundColor(.white)
                    .padding(.bottom,50)
                
                // } //z ปุมปิด
                
                //.frame(height: 10)
                VStack{
                 HStack(spacing: 16){ //search
                        
                        Button(action: {
                            isShowing.toggle()
                        }, label: {
                            NavigationLink(destination: HouseListView(query: $query,textinput: "House").navigationBarBackButtonHidden(true)) {
                                
                                Image(systemName:"circle.dashed")
                                
                                    .frame(width:24,height:24)
                                // .foregroundColor(.white)
                                //.padding(.leading,220)
                                // .offset(x:220)
                                
                                Text("House")
                                    .font(.system(size: 15, weight: .semibold))
                                Spacer()
                            }
                            
                        })
                    }
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    //.padding(.top,25)
                    
                    
                    
                    
                    
                    
                    HStack(spacing: 16){ //promotion
                        
                        Button(action: {},label :{
                            NavigationLink(destination: RenovateListView(query: $query,textinput:"Renovate").navigationBarBackButtonHidden(true)) {                            Image(systemName:"circle.dashed")
                                .frame(width:24,height:24)
                            Text("Renovate")
                                .font(.system(size: 15, weight: .semibold))
                            Spacer()
                        }
                            
                        })
                        
                    }
                    
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    
                    HStack(spacing: 16){ //favorite
                        
                            Button(action: {},label :{
                                NavigationLink(destination: HouseListView(query: $query,textinput: "Interior").navigationBarBackButtonHidden(true)) {                                Image(systemName:"circle.dashed")
                                .frame(width:24,height:24)
                            Text("Interior")
                                .font(.system(size: 15, weight: .semibold))
                            Spacer()
                        }
                                   
                        })
                    }
                    
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    
                    HStack(spacing: 16){ //company
                        
                        Button(action: {},label :{
                            NavigationLink(destination: RenovateListView(query: $query, textinput:"Knock down").navigationBarBackButtonHidden(true)) {                            Image(systemName:"circle.dashed")
                                    .frame(width:24,height:24)
                                Text("Knock down")
                                    .font(.system(size: 15, weight: .semibold))
                                Spacer()
                            }
                            
                        })
                        
                    }
                    
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    
                    HStack(spacing: 16){ //setting
                        
                        Button(action: {},label :{
                            NavigationLink(destination: SearchView(query: $query)){
                                Image(systemName:"circle.dashed")
                                    .frame(width:24,height:24)
                                Text("Search")
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            Spacer()
                            
                        })
                        
                    }
                    
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    
                   
                    
                    
                    HStack(spacing: 16){ //logout
                        
                        
                        Button(action:  {} ,label :{
                            NavigationLink(destination: FavoriteListView()){
                                HStack{
                                    Image(systemName:"circle.dashed")
                                        .frame(width:24,height:24)
                                    Text("Favorite")
                                        .font(.system(size: 15, weight: .semibold))
                                }
                                Spacer()
                            }
                        })
                        
                    }
                    
                    
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    
                    
                    HStack(spacing: 16){ //logout
                        
                        Button(action: {},label :{
                            NavigationLink(destination: CompanyListView()){                                Image(systemName:"circle.dashed")
                                    .frame(width:24,height:24)
                                Text("Company")
                                    .font(.system(size: 15, weight: .semibold))
                                Spacer()
                            }
                        })
                    }
                    
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    HStack(spacing: 16){ //logout
                        Button(action: {Reserveshowing=true},label :{
                            //NavigationLink(destination: //ReserveListView(reserves: $reserves)){
                            Image(systemName:"circle.dashed")
                                .frame(width:24,height:24)
                            Text("Reserve List")
                                .font(.system(size: 15, weight: .semibold))
                            Spacer()
                            //}
                        })
                    }
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    
                    
                    
                    
                    
                    
                    HStack(spacing: 16){ //logout
                        Button(action: {},label :{
                            NavigationLink(destination: WelcomeScreenView().navigationBarHidden(true)){
                                Image(systemName:"circle.dashed")
                                    .frame(width:24,height:24)
                                Text("Log out")
                                    .font(.system(size: 15, weight: .semibold))
                                Spacer()
                            }
                        })
                    }
                    
                    //Spacer()
                    .foregroundColor(.white)
                    .padding()
                    
                    
                    
                    
                }
                .offset(y:-50)
                Spacer()
                
                
            }
            .fullScreenCover(isPresented: $Reserveshowing,
                             content: ReserveListView.init)
            
            
            
        }.navigationBarHidden(true)
        //}
    }
}

















