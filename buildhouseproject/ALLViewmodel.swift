//
//  Viewmodel.swift
//  buildhouseproject
//
//  Created by pooh on 30/11/2565 BE.
//


import Foundation
import SwiftUI

//extension ContentView {
final class ALLViewModel: ObservableObject {
    @Published var allitems = [ALLItem]()
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = []
    
    //        @Published var savedComment: Set<String> = []
    //        @Binding var Comment
    /*
     @Published var renovateitems = [RenovateItem]()
     
     @Published var sumitems = [HouseItem]()
     
     sumitems.append(RenovateItem())
     */
    
    // Filter saved items
    var allfilteredItems: [ALLItem]  {
        if showingFavs {
            return allitems.filter { savedItems.contains($0.id) }
        }
        return allitems
    }
    
    private var db = Database()
    
    init() {
        self.savedItems = db.load()
        self.allitems = ALLItem.ALLsampleItems
    }
    
    func sortFavs() {
        withAnimation() {
            showingFavs.toggle()
        }
    }
    
    func sortFavsPage() {
        withAnimation() {
            showingFavs=true
        }
    }
    
    
    func contains(_ item: ALLItem) -> Bool {
        savedItems.contains(item.id)
    }
    
    // Toggle saved items
    func toggleFav(item: ALLItem) { //กด หัวใจ เอา id เข้า-ออก
        if contains(item) {
            savedItems.remove(item.id)
        } else {
            savedItems.insert(item.id)
        }
        db.save(items: savedItems)
    }
    
    /*     func addcomment (item: ALLItem){
     savedComment.insert(Comment) //change item.comment
     
     }
     */
    
    
    
    func search(with query: String = "" ) { //query เป็น object ในการกรองข้อมูล
        //contain array คือ methodตรวจสอบสมาชิก
        allitems = query.isEmpty ? allitems : allitems.filter {
            $0.name.contains(query) || $0.company.contains(query) || $0.price.contains(query)
        }
        
    }
    
    
}




final class HouseViewModel: ObservableObject {
    @Published var houseitems = [HouseItem]()
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = []
    
    
    // Filter saved items
    var housefilteredItems: [HouseItem]  {
        if showingFavs {
            return houseitems.filter { savedItems.contains($0.id) }
        }
        return houseitems
    }
    
    private var db = Database()
    
    init() {
        self.savedItems = db.load()
        self.houseitems = HouseItem.HousesampleItems
    }
    
}
    

final class RenovateViewModel: ObservableObject {
        @Published var renovateitems = [RenovateItem]()
        @Published var showingFavs = false
        @Published var savedItems: Set<Int> = []
        
        
        // Filter saved items
        var renovatefilteredItems: [RenovateItem]  {
            if showingFavs {
                return renovateitems.filter { savedItems.contains($0.id) }
            }
            return renovateitems
        }
        
        private var db = Database()
        
        init() {
            self.savedItems = db.load()
            self.renovateitems = RenovateItem.RenovatesampleItems
        }
        
    }
    

