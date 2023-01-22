//
//  FavoriteListView.swift
//  buildhouseproject
//
//  Created by pooh on 10/12/2565 BE.
//

import SwiftUI

struct FavoriteListView: View {
    @ObservedObject var vm = ALLViewModel()
    // @Binding var query : String
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(red: 0.80, green: 0.90, blue: 0.99)
                    .ignoresSafeArea()
                List {
                    //*******              // Button("Favorites Only", action: vm.sortFavs)
                    ForEach(vm.allfilteredItems) { item in
                        NavigationLink(destination: DetailView(item: ALLItem(id: item.id, image: item.image, name: item.name, price: item.price, company: item.company, description: item.description, isFaved: item.isFaved ,videoFileName: item.videoFileName, videoImage: item.videoImage                                                                         )) .navigationBarBackButtonHidden(true)        ) {
                            HStack {
                                VStack {
                                    Image(item.image)
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .frame(width: 130.0, height: 100.0)
                                        .padding(1)
                                    
                                    //.background(Color.blue)
                                    //.clipShape(RoundedRectangle(cornerRadius: 12))
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
                                //********
                                Image(systemName: vm.contains(item) ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.red)
                                    .onTapGesture {
                                        vm.toggleFav(item: item)
                                    }
                            }
                        }
                        .padding()
                        .background(Color(red: 0.80, green: 0.90, blue: 0.99))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                    }
                    .padding(-10)
                }
                .cornerRadius(10)
                .offset(y:-10)
                
                
            }
            .onAppear {
                vm.sortFavsPage()
            }
        }
        .navigationTitle("My Favorites").font(.headline)
        
    }
}





