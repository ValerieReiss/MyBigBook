//
//  FirstScene.swift
//  MyBigBook
//
//  Created by Valerie on 12.03.23.
//
import CoreMotion
import Foundation
import SpriteKit
import GameplayKit

enum CollisionType: UInt32 {
    case player = 1 //0000 0001 (1)
    case player1 = 2 //0000 0010 (2)
    case player2 = 4 //0000 0100 (4)
    case player3 = 8 //0000 1000 (8)
    case terrain = 16
}

struct PhysicsCategory {
    static let player       : UInt32 = 0x1 << 1
    static let player1        : UInt32 = 0x1 << 2
    static let player2         : UInt32 = 0x1 << 4
    static let player3      : UInt32 = 0x1 << 8
    static let terrain      : UInt32 = 0x1 << 16
    //static let create2      : UInt32 = 0x1 << 32
    //static let create3      : UInt32 = 0x1 << 64
}

class FirstScene: SKScene{

    let player = SKShapeNode(circleOfRadius: 50)
    let player1 = SKShapeNode(circleOfRadius: 50)
    let player2 = SKShapeNode(circleOfRadius: 50)
    let player3 = SKShapeNode(circleOfRadius: 50)
    
    
    let terrain = /*SKShapeNode (rectOf: CGSize(width: 200, height: 10),*/ SKShapeNode(rectOf: CGSize(width: 100, height: 10), cornerRadius: 3)
    
    var bottomBorder = SKShapeNode()
    var topBorder = SKShapeNode()
    var leftBorder = SKShapeNode()
    var rightBorder = SKShapeNode()
    
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    
    override func didMove(to view: SKView) {
        let image = SKSpriteNode(imageNamed: "backgroundAbcA")
        image.anchorPoint = CGPointMake(0.5, 0.5)
        image.size = CGSize(width: self.size.width, height: self.size.height)
        image.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        image.zPosition = -20
        addChild(image)
        
        
        //player.strokeColor = .black
        player.fillColor = .white
        player.fillTexture = SKTexture(imageNamed: "AbcA0")
        player.zPosition = 20
        player.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.isDynamic = true
        player.position = .init(x:frame.width/3, y:frame.height)
        addChild(player)
        
        //player1.strokeColor = .white
        player1.fillColor = .white
        player1.fillTexture = SKTexture(imageNamed: "AbcB")
        player1.zPosition = 20
        player1.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player1.physicsBody?.affectedByGravity = true
        player1.physicsBody?.isDynamic = true
        player1.position = .init(x:frame.width*2/3, y:frame.height)
        addChild(player1)
        
        //player2.strokeColor = .black
        player2.fillColor = .white
        player2.fillTexture = SKTexture(imageNamed: "AbcC")
        player2.zPosition = 20
        player2.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player2.physicsBody?.affectedByGravity = true
        player2.physicsBody?.isDynamic = true
        player2.position = .init(x:frame.width*3/4, y:frame.height)
        addChild(player2)
        
        //player3.strokeColor = .black
        player3.fillColor = .white
        player3.fillTexture = SKTexture(imageNamed: "AbcD")
        player3.zPosition = 20
        player3.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        player3.physicsBody?.affectedByGravity = true
        player3.physicsBody?.isDynamic = true
        player3.position = .init(x:frame.width*3/4, y:frame.height)
        addChild(player3)
        
        
        terrain.strokeColor = .white
        terrain.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 10))
        //terrain.fillColor = .white
        terrain.physicsBody?.affectedByGravity = false
        terrain.physicsBody?.isDynamic = false
        terrain.position = .init(x:300, y: 300)
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
        
        /*
        let camera = SKCameraNode()
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
            player1.physicsBody?.applyImpulse(CGVector(dx: endTouch.x - startTouch.x, dy: endTouch.y - startTouch.y))
            player2.physicsBody?.applyImpulse(CGVector(dx: endTouch.x - startTouch.x, dy: endTouch.y - startTouch.y))
            player3.physicsBody?.applyImpulse(CGVector(dx: endTouch.x - startTouch.x, dy: endTouch.y - startTouch.y))
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        }
        
        
        override func update(_ currentTime: TimeInterval) {
            
        }

    
}
