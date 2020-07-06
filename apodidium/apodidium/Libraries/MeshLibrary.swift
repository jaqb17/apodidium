//
//  MeshLibrary.swift
//  apodidium
//
//  Created by Jakub Sipika on 06/07/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import MetalKit

enum MeshType {
    case triangleCustom
    case quadCustom
}

class MeshLibrary {
    private static var meshes: [MeshType: Mesh] = [:]

    public static func initialize() {
        createDefaultMeshes()
    }

    private static func createDefaultMeshes() {
        meshes.updateValue(Triangle_CustomMesh(), forKey: .triangleCustom)
        meshes.updateValue(Quad_CustomMesh(), forKey: .quadCustom)
    }

    public static func mesh(_ type: MeshType) -> Mesh {
        return meshes[type]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! { return vertices.count }

    init() {
        createVertices()
        createBuffers()
    }

    func createVertices() {}

    func createBuffers() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
}

class Triangle_CustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: SIMD3<Float>(0.0, 1.0, 0.0), color: SIMD4<Float>(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-1.0, -1.0, 0.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(1.0, -1.0, 0.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0))
        ]
    }
}


class Quad_CustomMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: SIMD3<Float>(0.5, 0.5, 0.0), color: SIMD4<Float>(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-0.5, 0.5, 0.0), color: SIMD4<Float>(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-0.5, -0.5, 0.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0)),
            
            Vertex(position: SIMD3<Float>(0.5, 0.5, 0.0), color: SIMD4<Float>(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: SIMD3<Float>(-0.5, -0.5, 0.0), color: SIMD4<Float>(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: SIMD3<Float>(0.5, -0.5, 0.0), color: SIMD4<Float>(1.0, 0.0, 1.0, 1.0))
        ]
    }
}
