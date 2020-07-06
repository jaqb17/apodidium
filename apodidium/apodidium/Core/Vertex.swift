//
//  Vertex.swift
//  apodidium
//
//  Created by Jakub Sipika on 17/05/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import Foundation

struct Vertex:Sizeable {
       var position: SIMD3<Float>
       var color: SIMD4<Float>
   }

extension SIMD3:Sizeable {
}

extension SIMD4:Sizeable {
}
