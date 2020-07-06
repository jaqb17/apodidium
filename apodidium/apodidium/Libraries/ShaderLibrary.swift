//
//  ShaderLibrary.swift
//  apodidium
//
//  Created by Jakub Sipika on 06/07/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import MetalKit

enum VertexShaderType {
    case basic
}

enum FragmentShaderType {
    case basic
}

class ShaderLibrary {
    public static var defaultLibrary: MTLLibrary!

    private static var vertexShaders: [VertexShaderType: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderType: Shader] = [:]

    public static func initialize() {
        defaultLibrary = Engine.device.makeDefaultLibrary()
        createDefaultShaders()
    }

    public static func createDefaultShaders() {
        // vertex shader
        vertexShaders.updateValue(Basic_VertexShader(), forKey: .basic)

        // fragment shader
        fragmentShaders.updateValue(Basic_FragmentShader(), forKey: .basic)
    }

    public static func vertex(_ vertexShaderType: VertexShaderType) -> MTLFunction {
        return vertexShaders[vertexShaderType]!.function
    }

    public static func fragment(_ fragmentShaderType: FragmentShaderType) -> MTLFunction {
        return fragmentShaders[fragmentShaderType]!.function
    }
}

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction { get }
}

public struct Basic_VertexShader: Shader {
    var name: String = "Basic Vertex Shader"
    var functionName: String = "basic_vertex_shader" // Remember to use the same name here as on the .metal file
    var function: MTLFunction {
        let function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}

public struct Basic_FragmentShader: Shader {
    var name: String = "Basic Fragment Shader"
    var functionName: String = "basic_fragment_shader" // Remember to use the same name here as on the .metal file
    var function: MTLFunction {
        let function = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)
        function?.label = name
        return function!
    }
}
