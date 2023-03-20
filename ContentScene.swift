//
//  ContentScene.swift
//  MyBigBook
//
//  Created by Valerie on 19.03.23.
//

import SpriteKit
import GameplayKit

class ContentScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let image = SKSpriteNode(imageNamed: "ContentScene")
        image.anchorPoint = CGPointMake(0.5, 0.5)
        image.size = CGSize(width: self.size.width, height: self.size.height)
        image.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        image.zPosition = -10
        image.name = "content"
        addChild(image)
         
        //run("music")
        
        let button1 = SKSpriteNode(imageNamed: "button1")
        button1.size = CGSize(width: 100, height: 100)
        button1.position = CGPoint(x: 130, y: 270)
        button1.name = "button1"
        addChild(button1)
        let button2 = SKSpriteNode(imageNamed: "button2")
        button2.size = CGSize(width: 100, height: 100)
        button2.position = CGPoint(x: 240, y: 270)
        button2.name = "button2"
        addChild(button2)
        let button3 = SKSpriteNode(imageNamed: "button3")
        button3.size = CGSize(width: 100, height: 100)
        button3.position = CGPoint(x: 350, y: 270)
        button3.name = "button3"
        addChild(button3)
        let button4 = SKSpriteNode(imageNamed: "button4")
        button4.size = CGSize(width: 100, height: 100)
        button4.position = CGPoint(x: 460, y: 270)
        button4.name = "button4"
        addChild(button4)
        let button5 = SKSpriteNode(imageNamed: "button5")
        button5.size = CGSize(width: 100, height: 100)
        button5.position = CGPoint(x: 570, y: 270)
        button5.name = "button5"
        addChild(button5)
        
        let button6 = SKSpriteNode(imageNamed: "button6")
        button6.size = CGSize(width: 100, height: 100)
        button6.position = CGPoint(x: 130, y: 140)
        button6.name = "button6"
        addChild(button6)
        let button7 = SKSpriteNode(imageNamed: "button7")
        button7.size = CGSize(width: 100, height: 100)
        button7.position = CGPoint(x: 240, y: 140)
        button7.name = "button7"
        addChild(button7)
        let button8 = SKSpriteNode(imageNamed: "button8")
        button8.size = CGSize(width: 100, height: 100)
        button8.position = CGPoint(x: 350, y: 140)
        button8.name = "button8"
        addChild(button8)
        let button9 = SKSpriteNode(imageNamed: "button9")
        button9.size = CGSize(width: 100, height: 100)
        button9.position = CGPoint(x: 460, y: 140)
        button9.name = "button9"
        addChild(button9)
        let button10 = SKSpriteNode(imageNamed: "button10")
        button10.size = CGSize(width: 100, height: 100)
        button10.position = CGPoint(x: 570, y: 140)
        button10.name = "button10"
        addChild(button10)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in (touches) {
                let location = touch.location(in: self)
                let nodeTouched = atPoint(location)
                        if nodeTouched.name == "button1" {
                            self.view?.presentScene(FirstScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button2" {
                            self.view?.presentScene(SecondScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button3" {
                            self.view?.presentScene(ThirdScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button4" {
                            self.view?.presentScene(FourthScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button5" {
                            self.view?.presentScene(FifthScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button6" {
                            self.view?.presentScene(SixthScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button7" {
                            self.view?.presentScene(SeventhScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button8" {
                            self.view?.presentScene(EightScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button9" {
                            self.view?.presentScene(NinthScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        } else if nodeTouched.name == "button10" {
                            self.view?.presentScene(TenthScene(size: self.size),
                           transition: .crossFade(withDuration: 2))
                            run("sound-button")
                        }
               }
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
