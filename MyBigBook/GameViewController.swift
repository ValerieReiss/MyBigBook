//
//  GameViewController.swift
//  MyBigBook
//
//  Created by Valerie on 12.03.23.
//

import UIKit
import SpriteKit
import GameplayKit
import AVKit
import AVFoundation


class GameViewController: UIViewController {

    @IBOutlet weak var playVideo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func playVideo(_ sender: UIButton) {
        guard let url = URL(string: "https://example.com/my-example-video.m3u8") else { return }
        //let url = URL(fileURLWithPath: "./MyBigBook/music.mp3")
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
    
       // let audioPlayer = try AVAudioPlayer(contentsOf: ./MyBigBook, fileTypeHint: "music.mp3.rawValue")
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
    }
}
