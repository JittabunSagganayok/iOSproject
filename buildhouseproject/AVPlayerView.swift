//
//  AVPlayerView.swift
//  buildhouseproject
//
//  Created by pooh on 11/12/2565 BE.
//

import SwiftUI
import AVKit

struct AVPlayerView: UIViewControllerRepresentable {
    
    @Binding var videoName : String?
    
    private var player: AVPlayer {
        return AVPlayer(url: Bundle.main.url(forResource:self.videoName!, withExtension: "mp4")!)
    }
    func updateUIViewController(_ playerController:
                                AVPlayerViewController, context: Context) {
        playerController.modalPresentationStyle = .fullScreen
        playerController.player = player
        playerController.player?.play()
    }
    func makeUIViewController(context: Context) ->
    AVPlayerViewController {
        return AVPlayerViewController()
    }
}
