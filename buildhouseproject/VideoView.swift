//
//  VideoView.swift
//  buildhouseproject
//
//  Created by pooh on 11/12/2565 BE.
//

import SwiftUI

struct VideoView: View {
    //ตัวแปรรอรับค่าจาก VideoListView ตอนที่สร้าง VideoView
    var item : ALLItem
    
    //ตัวแปรสําหรับส่งข้อมูล VideoFileName ไปยัง AVPlayerView
    @State private var videoFileName : String?
    //ตัวแปรควบคุมการแสดง/ไม่แสดงหน้า AVPlayerView
    @State private var showVideoPlayer = false
    
    var body: some View {
        VStack{
            
            Button(action: {
                self.showVideoPlayer = true
                self.videoFileName = item.videoFileName}
                   , label: {
                VStack{
                    Image(uiImage: UIImage(named:item.videoImage)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(10)
                        .opacity(0.8)
                    
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                    //.padding(.horizontal, 15)
                        .offset(y:-120)
                    //.offset(x:-20)
                }
            })
            .fullScreenCover(isPresented: $showVideoPlayer) {
                AVPlayerView(videoName: self.$videoFileName)
                    .edgesIgnoringSafeArea(.all)
            }
            
           
        }
       
        
    }
}
