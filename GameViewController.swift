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
    
   /* override init(size: CGSize) {
        super.init(size: size)
        
    }
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }*/
    
    
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
        
        // Initialize Swipe Gesture Recognizer
           /* let swipeGestureRecognizerDown = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))*/
        
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
    
}
