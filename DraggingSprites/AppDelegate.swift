//
//  AppDelegate.swift
//  DraggingSprites
//
//  Created by Daniel Farrell on 19/03/2015.
//  Copyright (c) 2015 Daniel Farrell. All rights reserved.
//

import Cocoa
import SpriteKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    @IBOutlet weak var hostingView: SKView!
    
    var rootNode : SKNode?

    
    @IBAction func panAction(sender: AnyObject) {
        
        // Get the location in the view from the pan gesture recogniser
        let viewPoint = (sender as NSPanGestureRecognizer).locationInView(hostingView)
        // Convert from view -> scene -> root node coordinates
        let scenePoint = hostingView.convertPoint(viewPoint, toScene: hostingView.scene!)
        if let scene = hostingView.scene {
            
            if let root = self.rootNode {
                
                    let rootNodePoint = scene.convertPoint(scenePoint, toNode: root)
                    let node = root.nodeAtPoint(rootNodePoint)
                    node.position = rootNodePoint
                    println("Drag to point:", NSStringFromPoint(scenePoint))
                    return
                }
            }
        
        println("Node was nil.")
    }

    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        // Add and scene to the view and create a root node
        hostingView.presentScene(SKScene(size: CGSize(width: 1500.0, height: 1500.0)))
        rootNode = SKNode()
        
        // A a red circle
        let node = SKShapeNode(circleOfRadius: 50.0)
        node.lineWidth = 5.0
        node.strokeColor = NSColor.whiteColor()
        node.fillColor = NSColor.redColor()
        node.userInteractionEnabled = true
        rootNode?.addChild(node)
        hostingView.scene?.addChild(rootNode!)
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

