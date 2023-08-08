//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color1 ("Color1", Color) = (1,1,0,0.5)
_Color2 ("Color2", Color) = (1,0.28235295,0,0)
_MainTex ("Combo (R=A1,G=A2,B=Mask)", 2D) = "black" { }
_TilingRG ("Tiling for R(.xy) and G(.zw) channels", Vector) = (1,1,1,1)
_Vspeed ("Vspeed ", Range(0, 10)) = 1
_Vmultiply ("Vmultiply", Range(0, 10)) = 1.5
_Stencil ("Stencil ID", Float) = 0
[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Compare Function", Float) = 3
}
SubShader {
 Pass {
  LOD 100
  Tags { "QUEUE" = "Geometry+2" "RenderType" = "Opaque" }
  Stencil {
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 21923
}
}
}