//
//  Shaders.metal
//  apodidium
//
//  Created by Jakub Sipika on 17/05/2020.
//  Copyright © 2020 Jakub Sipika. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct RasterizerData {
    float4 position [[ position ]];
    float4 color;
};

// vertex = type of shader
// float4 = return type
// basic_vertex_shader = name of the shader.  This should match the vertex function in swift.
vertex RasterizerData basic_vertex_shader(const VertexIn vIn[[ stage_in ]], uint vertexID [[ vertex_id ]]) {
    RasterizerData rd;
    rd.position = float4(vIn.position,1.0);
    rd.color = vIn.color;
    return rd;
}

// Likewise for the basic fragment shader

// fragment = type of shader
// half4 = return type
// basic_fragmeent_shader = name of the shader.  This should match the vertex function in swift.
fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]]) {
    float4 color = rd.color;
    return half4(color.r, color.g, color.b, color.a);
}
