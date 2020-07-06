//
//  GameObject.swift
//  apodidium
//
//  Created by Jakub Sipika on 06/07/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import MetalKit

class GameObject: Node {
    var mesh: Mesh
    init(meshType: MeshType) {
        mesh = MeshLibrary.mesh(meshType)
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        //        renderCommandEncoder.setTriangleFillMode(.lines)
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
