//
//  SeventhScene.swift
//  MyBigBook
//
//  Created by Valerie on 20.03.23.
//

import Foundation
import SpriteKit
import GameplayKit

class SeventhScene: SKScene{
    override func didMove(to view: SKView) {
        let image = SKSpriteNode(imageNamed: "backgroundAbcW")
        image.anchorPoint = CGPointMake(0.5, 0.5)
        image.size = CGSize(width: self.size.width, height: self.size.height)
        image.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        image.zPosition = -20
        addChild(image)
        
    }
}
