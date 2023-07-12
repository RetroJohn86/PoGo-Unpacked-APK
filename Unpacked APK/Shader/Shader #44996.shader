//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_StencilMask ("Masked Stencil Id", Range(0, 255)) = 0
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Geometry" }
  ColorMask 0 0
  Stencil {
   Comp Equal
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 11839
}
}
}