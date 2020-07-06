//
//  RenderPipelineStateLibrary.swift
//  apodidium
//
//  Created by Jakub Sipika on 06/07/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import MetalKit

enum RenderPipelineStateType {
    case basic
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates: [RenderPipelineStateType: RenderPipelineState] = [:]

    public static func initialize() {
        createDefaultRenderPipelineStates()
    }

    private static func createDefaultRenderPipelineStates() {
        renderPipelineStates.updateValue(Basic_RenderPipelineState(), forKey: .basic)
    }

    public static func pipelineState(_ type: RenderPipelineStateType) -> MTLRenderPipelineState {
        return renderPipelineStates[type]!.renderPipelineState
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

public struct Basic_RenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"

    var renderPipelineState: MTLRenderPipelineState {
        var renderPipelineState: MTLRenderPipelineState!
        do {
            renderPipelineState = try Engine.device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.basic))
        } catch let error as NSError {
            print(error)
        }
        return renderPipelineState
    }
}
