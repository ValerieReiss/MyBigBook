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
        image.size = CGSize(width: 830, height: frame.height)
        //image.position = CGPoint(x: frame.width/2, y: frame.height/2)
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
