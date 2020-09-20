//
//  TestVirusViewController.swift
//  Viraze
//
//  Created by Granwyn Tan on 23/8/20.
//  Copyright © 2020 Granwyn Tan. All rights reserved.
//

import UIKit
import AVFoundation
//import AVKit

class TestVirusViewController: UIViewController {
    @IBOutlet var background: UIView!
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playVirusVideo()
    }
    
    func playVirusVideo() {
        guard let path = Bundle.main.path(forResource: "Virus", ofType: "mov") else {return}
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspect
        background.layer.addSublayer(playerLayer)
        player.play()
        loopVideo(videoPlayer: player)
    }
    func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil, queue: nil) { notification in
            videoPlayer.seek(to: CMTime.zero)
            videoPlayer.play()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    /*
     func playBackgoundVideo() {
         if let filePath = Bundle.main.path(forResource: "your_video_here", ofType:"mp4") {
             let filePathUrl = NSURL.fileURL(withPath: filePath)
             player = AVPlayer(url: filePathUrl)
             let playerLayer = AVPlayerLayer(player: player)
             playerLayer.frame = self.videoView.bounds
             playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
             NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil) { (_) in
                 self.player?.seek(to: kCMTimeZero)
                 self.player?.play()
             }
             self.videoView.layer.addSublayer(playerLayer)
             player?.play()
         }
     }
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
