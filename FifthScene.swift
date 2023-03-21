//
//  FifthScene.swift
//  MyBigBook
//
//  Created by Valerie on 12.03.23.
//


import Foundation
import SpriteKit
import GameplayKit

class FifthScene: SKScene{
    override func didMove(to view: SKView) {
         let image = SKSpriteNode(imageNamed: "backgroundAbcQ")
         image.anchorPoint = CGPointMake(0.5, 0.5)
         image.size = CGSize(width: self.size.width, height: self.size.height)
         image.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
         image.zPosition = -20
         addChild(image)
         
         let buchstaben = SKSpriteNode(imageNamed: "AbcQ")
         buchstaben.size = CGSize(width: self.size.width*3/4, height: self.size.height*3/4)
         buchstaben.position = CGPoint(x: size.width/2, y: size.height/2)
         buchstaben.zPosition = 0
         addChild(buchstaben)
        
        let buttonBack = SKSpriteNode(imageNamed: "buttonBack")
        buttonBack.name = "buttonBack"
        buttonBack.setScale(0.3)
        buttonBack.blendMode = SKBlendMode.multiply
        buttonBack.position = CGPoint(x: size.width/20, y: size.height - 50)
        buttonBack.zPosition = 2
        addChild(buttonBack)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            let node = atPoint(location)
                if node.name == "buttonBack" {
                    self.view?.presentScene(ContentScene(size: self.size),
                    transition: .crossFade(withDuration: 2))
                    run("sound-button")}
            
            var plouf = SKShapeNode(circleOfRadius: 10)
            plouf.fillTexture = SKTexture(imageNamed: "magicstick.png")
            plouf.fillColor = .white
            
            plouf.zPosition = 20
            plouf.position = location
            self.addChild(plouf)
        /*
        let node = atPoint(location)
            if node.name == "buttonBack" {
                self.view?.presentScene(ContentScene(size: self.size),
                transition: .crossFade(withDuration: 2))
                run("sound-button")}*/
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in:self)
            var plouf = SKShapeNode(circleOfRadius: 10)
            plouf.fillTexture = SKTexture(imageNamed: "magicstick.png")
            plouf.fillColor = .white
            
            plouf.zPosition = 20
            plouf.position = location
            self.addChild(plouf)
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func run(_ fileName: String){
            run(SKAction.playSoundFileNamed(fileName, waitForCompletion: true))
    }

}

