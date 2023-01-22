//
//  ReserveListView.swift
//  buildhouseproject
//
//  Created by pooh on 29/12/2565 BE.
//

import SwiftUI

struct ReserveListView: View {
    
    //let date = Date()
    
    static let stackDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss z"
        return formatter
    }()
    
    @State private var showingalert = false
    
    @Environment(\.presentationMode) var myReserveListView
    
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath:
                                            \Reserve.reserveDate, ascending: true)], animation: .default)
    var reserves: FetchedResults<Reserve>
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
            showingalert=true
            offsets.map { reserves[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
                
            }
            catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        
        
    }
    
    
    
    var body: some View {
        NavigationView{//เปิด NavigationView
            //Text("ส่วนแสดงผลข้อมูล")
            
            List {//เปิด List
                ForEach(reserves, id:\.self) { index in
                    HStack{
                        Text(index.reserveName!)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                        Spacer()
                        Text(index.reserveDate!, format: Date.FormatStyle().year().month().day()/*.weekday()*/.hour().minute()/*.second()*/)
                    }
                    .padding(.horizontal,15)
                }
                .onDelete(perform: deleteItems)
            }//ปิด List
            .listStyle(.plain)
            .navigationTitle("Reserve List")
            
            
            .toolbar { //เปิด .toolbar
                ToolbarItemGroup(placement:ToolbarItemPlacement.navigationBarLeading){
                    
                    Button(action: {myReserveListView.wrappedValue.dismiss()}, label: {
                        Text("Back")
                        .foregroundColor(Color.blue)    })
                }
                ToolbarItemGroup(placement:ToolbarItemPlacement.navigationBarTrailing){
                    
                    EditButton()
                    
                }
                
                
                
                
            }
        }//ปิด NavigationView
        .navigationViewStyle(.stack)
        .alert("ยกเลิกนัดหมายเรียบร้อย",isPresented: $showingalert) {
            Button("OK", role: .cancel) { }
        }        }
}


/*
 struct ReserveListView_Previews: PreviewProvider {
 static var previews: some View {
 ReserveListView()
 }
 }
 */
