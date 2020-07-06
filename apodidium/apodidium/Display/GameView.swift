//
//  GameView.swift
//  apodidium
//
//  Created by Jakub Sipika on 17/05/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//
import MetalKit

class GameView: MTKView {
    
    var renderer: Renderer!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        // Device = The abstract representation of the gpu
        self.device = MTLCreateSystemDefaultDevice()
        Engine.start(device: self.device!)
        
        self.clearColor = Preferences.clearColor
        
        // The MTKView Pixel Format
        self.colorPixelFormat = Preferences.mainPixelFormat
        
        self.renderer = Renderer()
        self.delegate = renderer
    }
    
}
