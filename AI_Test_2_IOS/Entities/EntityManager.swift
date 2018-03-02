//
//  EntityManager.swift
//  AI_Test_2_IOS
//
//  Created by Timothy Dowling on 2018-03-01.
//  Copyright © 2018 Timothy Dowling. All rights reserved.
//

import GameplayKit

class EntityManager {
    let gameScene: SKScene
    var entities = [GKEntity]()
    
    init(scene: SKScene) {
        gameScene = scene
    }
    
    func add(entity: GKEntity){
        guard let sprite = entity.component(ofType: SpriteComponent.self)?.node else {
            return
        }
        
        gameScene.addChild(sprite)
        entities.append(entity)
    }
    
    func update(dt: TimeInterval) {
        for entity in entities {
            entity.update(deltaTime: dt)
        }
    }
}
