//
//  SizeableProtocol.swift
//  apodidium
//
//  Created by Jakub Sipika on 17/05/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import simd

protocol Sizeable {}

extension Sizeable {
    static var size: Int {
        return MemoryLayout<Self>.size
    }

    static var stride: Int {
        return MemoryLayout<Self>.stride
    }

    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }

    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}
