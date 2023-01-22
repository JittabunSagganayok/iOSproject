//
//  SwiftUIViewxxx.swift
//  buildhouseproject
//
//  Created by pooh on 25/12/2565 BE.
//

import SwiftUI

struct Reserveinput: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    private func addItem() {
        withAnimation {
            let newReserve = Reserve(context: viewContext)
            newReserve.reserveName = reservename
            newReserve.reserveDate = currentDate
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
    @State var currentDate: Date = Date()
    //@Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State var reservename: String = " "
    
    var body: some View {
        VStack{
            HStack{
                Text("ชื่อนัดหมาย : ")
                    .font(.callout)
                    .bold()
                TextField("Reserve Name...", text: $reservename)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }.padding()
            
            
            DatePicker("Select Date", selection: $currentDate)
            /*Text(currentDate, style: .date)
             .font(.largeTitle)
             .fontWeight(.bold)
             */
                .padding()
            
            Button(action: {
                //self.presentationMode.wrappedValue.dismiss()
                /*reservename = reservename
                 currentDate = currentDate*/
                
                self.addItem()
                showingAlert = true
                
            }) {
                Text("Done")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(10)
            }.alert("นัดหมายเรียบร้อย", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            
            
            
        }.padding(.horizontal, 20)
    }
}

struct Reserveinput_Previews: PreviewProvider {
    static var previews: some View {
        Reserveinput()
    }
}
