//
//  SearchView.swift
//  buildhouseproject
//
//  Created by pooh on 12/11/2565 BE.
//

// หน้า SearchView
import SwiftUI

struct SearchView : View {
    
    //  @StateObject var vm = BuildViewModel()
    // @Binding var vm = BuildViewModel()
    
    @ObservedObject var vm = ALLViewModel()
    @Binding var query : String
    
    var body: some View {
        
            
            
            
            
            NavigationView{
                ZStack{
                    Color(red: 0.80, green: 0.90, blue: 0.99)
                        .ignoresSafeArea()
                    List {
                        
                        ForEach(vm.allfilteredItems) { item in
                            NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved,videoFileName: item.videoFileName, videoImage: item.videoImage )) .navigationBarBackButtonHidden(true)        ) {
                                HStack {
                                    VStack {
                                        Image(item.image)
                                            .resizable()
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .frame(width: 130.0, height: 90.0)
                                            .padding(1)
                                        
                                        
                                    }
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .foregroundColor(Color.blue)
                                            .font(.headline)
                                        Text("Price : \(item.price) M")
                                            .font(.subheadline)
                                        Text("By \(item.company)")
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    
                                }
                            }
                            .padding(5)
                            .background(Color(red: 0.80, green: 0.90, blue: 0.99))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                        }
                        .padding(-10)
                    }
                    .cornerRadius(10)
                    .offset(y:-10)
                }
            }
            //.background(Color(red: 0.80, green: 0.90, blue: 0.99))
            .navigationTitle("Search").font(.headline)
            .background(Color(red: 0.80, green: 0.90, blue: 0.99))
            .searchable(text: $query,
                        placement:.navigationBarDrawer(displayMode:.always),
                        prompt:"Search...") {
                
            }
                        .onSubmit(of: .search) {
                            vm.search(with: query)
                        }
            
                        .onChange(of: query) { newQuery in
                            vm.search(with: newQuery)
                        }
                        .onAppear {
                            vm.search(with: query)
                        }
            
            
                        .overlay {
                            if vm.allfilteredItems.isEmpty{
                                EmptyView(query: $query)
                            }
                        }
        
    }
}
