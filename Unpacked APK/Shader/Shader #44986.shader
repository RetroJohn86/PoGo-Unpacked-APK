//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
[Header(STENCIL PROPERTIES)] _Stencil ("Stencil ID [0;255]", Float) = 0
_ReadMask ("Stencil Read Mask [0;255]", Float) = 255
_WriteMask ("Stencil Write Mask [0;255]", Float) = 255
[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Comparison", Float) = 8
[Enum(UnityEngine.Rendering.StencilOp)] _StencilOp ("Stencil Operation", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("Stencil Fail", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("Stencil ZFail", Float) = 0
}
SubShader {
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 45448
}
}
}