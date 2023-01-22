//
//  database.swift
//  buildhouseproject
//
//  Created by pooh on 30/11/2565 BE.
//

import Foundation

//class Database ทำให้ปิดแอพแล้วยังอยู่


final class Database {
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
        
    }
}
