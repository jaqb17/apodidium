//
//  Preferences.swift
//  apodidium
//
//  Created by Jakub Sipika on 06/07/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

import MetalKit

public enum ClearColors{
    static let white = MTLClearColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static let grey = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    static let apoTeal = MTLClearColor(red: 0.0, green: 0.5, blue: 0.466, alpha: 1.0)
}

class Preferences {
    public static var clearColor = ClearColors.apoTeal
    public static var mainPixelFormat = MTLPixelFormat.bgra8Unorm
}
