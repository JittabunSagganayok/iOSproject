//
//  CompanylistView.swift
//  buildhouseproject
//
//  Created by pooh on 9/12/2565 BE.
//


import SwiftUI

struct CompanyListView: View {
    @ObservedObject var vm = ALLViewModel()
    // @Binding var query : String
    @State var query = ""
    var body: some View {
        
            //NavigationView{
            VStack{
                
                Text("Company List")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .offset(y:-30)
                    .foregroundColor(Color.black)
                
                List {
                   
                    
                        
                        //*******              // Button("Favorites Only", action: vm.sortFavs)
                        ForEach(vm.allfilteredItems) { item in
                            NavigationLink(destination: CompanydetailView() /*.navigationBarBackButtonHidden(true)*/        ) {
                                HStack {
                                    VStack {
                                        Image(item.company)
                                            .resizable()
                                            .clipShape(RoundedRectangle(cornerRadius: 100))
                                            .frame(width: 50.0, height: 50.0)
                                            .padding(1)
                                        
                                       
                                    }
                                    VStack(alignment: .leading) {
                                        Text(item.company)
                                            .foregroundColor(Color.blue)
                                            .font(.headline)
                                        /*Text("Price : \(item.price) M")
                                         .font(.subheadline)*/
                                        Text("Company : \(item.company) Co.,Ltd.")
                                            .font(.subheadline)
                                            .foregroundColor(Color.black)
                                    }
                                    Spacer()
                                    
                                }
                            }
                            .padding()
                            .background(Color(red: 0.80, green: 0.90, blue: 0.99))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                        }
                        //.background(Color(red: 0.80, green: 0.90, blue: 0.99))
                        .padding(-10)
                   
                        
                    
                    
                    
                }
                //.background(Color(red: 0.80, green: 0.90, blue: 0.99))
                .cornerRadius(10)
                .offset(y:-40)
                
                
                
            }
            
            
        
        .background(Color(red: 0.80, green: 0.90, blue: 0.99))
        
    }
}
