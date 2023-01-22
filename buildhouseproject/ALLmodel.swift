//
//  FAVmodel.swift
//  buildhouseproject
//
//  Created by pooh on 30/11/2565 BE.
//

import Foundation

struct HouseItem: Identifiable, Codable {
    
    var id : Int
    var image : String
    var name : String
    var price:String
    var company: String
    var description: String
    var isFaved: Bool
    var videoFileName : String
    var videoImage : String
    
    
    static var HousesampleItems: [HouseItem] {
        var HouseList = [HouseItem]()
        
        
        
        HouseList.append(HouseItem(id: 1, image: "1", name: "Modern House", price: "5.99", company: "Landy", description:"บ้าน 2 ชั้น สไตล์ Modern สำหรับครอบครัวขนาดกลาง ออกแบบให้ดูเรียบง่ายแต่สง่างาม ทุก ๆ ห้องสามารถรับวิวรอบบ้านได้ผ่านหน้าต่างขนาดใหญ่ มีการใช้พื้นที่อย่างคุ้มค่า มีชานนอกบ้าน สำหรับพักผ่อนของคนในครอบครัวทั้งชั้น 1 และชั้น 2" , isFaved: false,videoFileName: "Landyhomevid1", videoImage: "1"))
        
        HouseList.append(HouseItem(id: 2, image: "2", name: "Classic House", price: "2.99", company: "Seacon", description: "บ้านชั้นเดียว บรรยากาศอ่อนหวาน ผ่อนคลาย คงไว้ซึ่งความรู้สึกอบอุ่นของการอยู่อาศัย เน้นประโยชน์ใช้สอยของสมาชิกในครอบครัวได้ทำกิจกรรมร่วมกัน แยกส่วนห้องนอนด้านข้างเพื่อเป็นพื้นที่ส่วนตัว และอีกส่วนเป็นพื้นที่ส่วนกลาง โดยเชื่อมต่อด้วยระเบียงขนาดใหญ่", isFaved: false,videoFileName: "Seaconvid1", videoImage: "2"))
        
        HouseList.append(HouseItem(id: 3, image: "3", name: "Office House", price: "7.99", company: "Royalhouse", description: "แบบบ้านสามชั้น ชั้นหนึ่ง ฟังก์ชั่นครบครัน ทั้งห้องนั่งเล่น ห้องรับแขก ห้องรับประทานอาหาร ห้องครัว 1 ห้องนอนและห้องน้ำ ชั้นสอง ห้องนอนใหญ่ ห้องนั่งเล่น และห้องพระ ชั้นสาม 2 ห้องนอนและห้องน้ำในตัว 1 ห้องทำงาน", isFaved: false,videoFileName: "Royalhousevid1", videoImage: "3"))
        
        return HouseList
        
    }
    
    
}

struct RenovateItem: Identifiable, Codable {
    
    var id : Int
    var image : String
    var name : String
    var price:String
    var company: String
    var description: String
    var isFaved: Bool
    var videoFileName : String
    var videoImage : String
    
    
    static var RenovatesampleItems: [RenovateItem] {
        var RenovateList = [RenovateItem]()
        
        
        RenovateList.append(RenovateItem(id: 4, image: "roommaker1", name: "Renovate No.1", price: "5.99", company: "Roommaker", description:"บ้าน 2 ชั้น สไตล์ Modern สำหรับครอบครัวขนาดกลาง ออกแบบให้ดูเรียบง่ายแต่สง่างาม ทุก ๆ ห้องสามารถรับวิวรอบบ้านได้ผ่านหน้าต่างขนาดใหญ่ มีการใช้พื้นที่อย่างคุ้มค่า มีชานนอกบ้าน สำหรับพักผ่อนของคนในครอบครัวทั้งชั้น 1 และชั้น 2" , isFaved: false,videoFileName: "Landyhomevid1", videoImage: "roommaker1"))
        
        RenovateList.append(RenovateItem(id: 5, image: "room1", name: "Renovate No.2", price: "2.99", company: "ActArt", description: "บ้านชั้นเดียว บรรยากาศอ่อนหวาน ผ่อนคลาย คงไว้ซึ่งความรู้สึกอบอุ่นของการอยู่อาศัย เน้นประโยชน์ใช้สอยของสมาชิกในครอบครัวได้ทำกิจกรรมร่วมกัน แยกส่วนห้องนอนด้านข้างเพื่อเป็นพื้นที่ส่วนตัว และอีกส่วนเป็นพื้นที่ส่วนกลาง โดยเชื่อมต่อด้วยระเบียงขนาดใหญ่", isFaved: false,videoFileName: "Landyhomevid1", videoImage: "room1"))
        
        RenovateList.append(RenovateItem(id: 6, image: "dd4", name: "Renovate No.3", price: "7.99", company: "DDproperty", description: "แบบบ้านสามชั้น ชั้นหนึ่ง ฟังก์ชั่นครบครัน ทั้งห้องนั่งเล่น ห้องรับแขก ห้องรับประทานอาหาร ห้องครัว 1 ห้องนอนและห้องน้ำ ชั้นสอง ห้องนอนใหญ่ ห้องนั่งเล่น และห้องพระ ชั้นสาม 2 ห้องนอนและห้องน้ำในตัว 1 ห้องทำงาน", isFaved: false,videoFileName: "Landyhomevid1", videoImage: "dd4"))
        
        return RenovateList
        
    }
    
    
}


struct ALLItem: Identifiable, Codable {
    
    var id : Int
    var image : String
    var name : String
    var price:String
    var company: String
    var description: String
    var isFaved: Bool
    var videoFileName : String
    var videoImage : String
    
    static var ALLsampleItems: [ALLItem] {
        var ALLList = [ALLItem]()
        
        ALLList.append(ALLItem(id: 1, image: "1", name: "Modern House", price: "5.99", company: "Landy", description:"บ้าน 2 ชั้น สไตล์ Modern สำหรับครอบครัวขนาดกลาง ออกแบบให้ดูเรียบง่ายแต่สง่างาม ทุก ๆ ห้องสามารถรับวิวรอบบ้านได้ผ่านหน้าต่างขนาดใหญ่ มีการใช้พื้นที่อย่างคุ้มค่า มีชานนอกบ้าน สำหรับพักผ่อนของคนในครอบครัวทั้งชั้น 1 และชั้น 2" , isFaved: false,videoFileName: "Landyhomevid1", videoImage: "1"))
        
        ALLList.append(ALLItem(id: 2, image: "2", name: "Classic House", price: "2.99", company: "Seacon", description: "บ้านชั้นเดียว บรรยากาศอ่อนหวาน ผ่อนคลาย คงไว้ซึ่งความรู้สึกอบอุ่นของการอยู่อาศัย เน้นประโยชน์ใช้สอยของสมาชิกในครอบครัวได้ทำกิจกรรมร่วมกัน แยกส่วนห้องนอนด้านข้างเพื่อเป็นพื้นที่ส่วนตัว และอีกส่วนเป็นพื้นที่ส่วนกลาง โดยเชื่อมต่อด้วยระเบียงขนาดใหญ่", isFaved: false,videoFileName: "Seaconvid1", videoImage: "2"))
        
        ALLList.append(ALLItem(id: 3, image: "3", name: "Office House", price: "7.99", company: "Royalhouse", description: "แบบบ้านสามชั้น ชั้นหนึ่ง ฟังก์ชั่นครบครัน ทั้งห้องนั่งเล่น ห้องรับแขก ห้องรับประทานอาหาร ห้องครัว 1 ห้องนอนและห้องน้ำ ชั้นสอง ห้องนอนใหญ่ ห้องนั่งเล่น และห้องพระ ชั้นสาม 2 ห้องนอนและห้องน้ำในตัว 1 ห้องทำงาน", isFaved: false,videoFileName: "Royalhousevid1", videoImage: "3"))
        
        ALLList.append(ALLItem(id: 4, image: "roommaker1", name: "Renovate No.1", price: "5.99", company: "Roommaker", description:"บ้าน 2 ชั้น สไตล์ Modern สำหรับครอบครัวขนาดกลาง ออกแบบให้ดูเรียบง่ายแต่สง่างาม ทุก ๆ ห้องสามารถรับวิวรอบบ้านได้ผ่านหน้าต่างขนาดใหญ่ มีการใช้พื้นที่อย่างคุ้มค่า มีชานนอกบ้าน สำหรับพักผ่อนของคนในครอบครัวทั้งชั้น 1 และชั้น 2" , isFaved: false,videoFileName: "Landyhomevid1", videoImage: "roommaker1"))
        
        ALLList.append(ALLItem(id: 5, image: "room1", name: "Renovate No.2", price: "2.99", company: "ActArt", description: "บ้านชั้นเดียว บรรยากาศอ่อนหวาน ผ่อนคลาย คงไว้ซึ่งความรู้สึกอบอุ่นของการอยู่อาศัย เน้นประโยชน์ใช้สอยของสมาชิกในครอบครัวได้ทำกิจกรรมร่วมกัน แยกส่วนห้องนอนด้านข้างเพื่อเป็นพื้นที่ส่วนตัว และอีกส่วนเป็นพื้นที่ส่วนกลาง โดยเชื่อมต่อด้วยระเบียงขนาดใหญ่", isFaved: false,videoFileName: "Landyhomevid1", videoImage: "room1"))
        
        ALLList.append(ALLItem(id: 6, image: "dd4", name: "Renovate No.3", price: "7.99", company: "DDproperty", description: "แบบบ้านสามชั้น ชั้นหนึ่ง ฟังก์ชั่นครบครัน ทั้งห้องนั่งเล่น ห้องรับแขก ห้องรับประทานอาหาร ห้องครัว 1 ห้องนอนและห้องน้ำ ชั้นสอง ห้องนอนใหญ่ ห้องนั่งเล่น และห้องพระ ชั้นสาม 2 ห้องนอนและห้องน้ำในตัว 1 ห้องทำงาน", isFaved: false,videoFileName: "Landyhomevid1", videoImage: "dd4"))
        
        return ALLList
        
    }
    
    
}
