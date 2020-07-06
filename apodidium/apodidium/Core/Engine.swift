//
//  Engine.swift
//  apodidium
//
//  Created by Jakub Sipika on 06/07/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import MetalKit

class Engine {
    
    public static var device: MTLDevice!
    public static var commandQueue: MTLCommandQueue!
    
    public static func start(device: MTLDevice) {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        
        ShaderLibrary.initialize()
        VertexDescriptorLibrary.initialize()
        RenderPipelineDescriptorLibrary.initialize()
        RenderPipelineStateLibrary.initialize()
        MeshLibrary.initialize()
    }
}
