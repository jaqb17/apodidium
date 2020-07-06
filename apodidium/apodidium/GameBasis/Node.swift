//
//  Node.swift
//  apodidium
//
//  Created by Jakub Sipika on 06/07/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import MetalKit

class Node {
    func render(renderCommandEncoder:MTLRenderCommandEncoder){
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
}
