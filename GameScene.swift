//
//  GameScene.swift
//  MyBigBook
//
//  Created by Valerie on 12.03.23.
//
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
      
        let image = SKSpriteNode(imageNamed: "backgroundCover")
        image.anchorPoint = CGPointMake(0.5, 0.5)
        image.size = CGSize(width: self.size.width, height: self.size.height)
        image.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        image.zPosition = 0
        image.name = "nextPage"
        addChild(image)
         
        //run("music")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard var touch = touches.first else {return}
        touch = (touches.first as UITouch?)!
        let location = touch.location(in: self)
        print ("readout \(location.x) and \(location.y)")
        let node = self.atPoint(location)
        if node.name == "nextPage"{
            print ("One Object touched")
            
            self.view?.presentScene(ContentScene(size: self.size),
            transition: .crossFade(withDuration: 1.5))
        } else if node.name != "nextPage" {print ("failed ButtonNextPage")}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func run(_ fileName: String){
            run(SKAction.playSoundFileNamed(fileName, waitForCompletion: true))
    }
    
    
}
