//
//  SecondScene.swift
//  MyBigBook
//
//  Created by Valerie on 12.03.23.
//


import Foundation
import SpriteKit
import GameplayKit

class SecondScene: SKScene{
    let player = SKShapeNode(circleOfRadius: 16)
    let terrain = /*SKShapeNode (rectOf: CGSize(width: 200, height: 10),*/ SKShapeNode(rectOf: CGSize(width: 200, height: 10), cornerRadius: 0.5)
    
    let abcA = SKShapeNode (fileNamed: "abcA.png")
    
    var bottomBorder = SKShapeNode()
    var topBorder = SKShapeNode()
    var leftBorder = SKShapeNode()
    var rightBorder = SKShapeNode()
    
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    
    override func didMove(to view: SKView) {
        let image = SKSpriteNode(imageNamed: "backgroundAbcE")
        image.anchorPoint = CGPointMake(0.5, 0.5)
        image.size = CGSize(width: self.size.width, height: self.size.height)
        image.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        image.zPosition = -20
        addChild(image)
       /*
        abcA.physicsBody = SKPhysicsBody(rectangleOf: abcA.size)
        abcA.physicsBody?.affectedByGravity = true
        abcA.physicsBody?.isDynamic = true
        addChild(abcA)
        */
        
        player.strokeColor = .black
        player.fillColor = .black
        player.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.isDynamic = true
        player.position = .init(x:frame.width/2, y:frame.height)
        addChild(player)
        
        terrain.strokeColor = .white
        terrain.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 10))
        //terrain.fillColor = .white
        terrain.physicsBody?.affectedByGravity = false
        terrain.physicsBody?.isDynamic = false
        terrain.position = .init(x:image.size.width/2, y: frame.height/2)
        addChild(terrain)
        
        bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: image.size.width, height: 2))
        bottomBorder.physicsBody?.affectedByGravity = false
        bottomBorder.physicsBody?.isDynamic = false
        bottomBorder.position = .init(x:image.size.width/2, y: 0)
        addChild(bottomBorder)
        
        topBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 2))
        topBorder.physicsBody?.affectedByGravity = false
        topBorder.physicsBody?.isDynamic = false
        topBorder.position = .init(x:image.size.width/2, y: image.size.height)
        addChild(topBorder)
        
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 2, height: frame.height))
        leftBorder.physicsBody?.affectedByGravity = false
        leftBorder.physicsBody?.isDynamic = false
        leftBorder.position = .init(x:0, y: image.size.height/2)
        addChild(leftBorder)
        
        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 2, height: frame.height))
        rightBorder.physicsBody?.affectedByGravity = false
        rightBorder.physicsBody?.isDynamic = false
        rightBorder.position = .init(x:image.size.width, y: image.size.height/2)
        addChild(rightBorder)
        
        /*let camera = SKCameraNode()
        camera.setScale(2)
        addChild(camera)
        scene!.camera = camera
        */
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                startTouch = touch.location(in: self)
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
        {
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                endTouch = touch.location(in: self)
            }
            player.physicsBody?.applyImpulse(CGVector(dx: endTouch.x - startTouch.x, dy: endTouch.y - startTouch.y))
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        }
        
        
        override func update(_ currentTime: TimeInterval) {
            
        }

    
}
