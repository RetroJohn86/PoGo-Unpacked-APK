//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_TintColor ("Tint Color", Color) = (1,1,1,1)
_OffsetFactor ("Z Offset Factor", Float) = 0
_OffsetUnits ("Z Offset Units", Float) = 0
[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Culling Mode (None = double-sided)", Float) = 2
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "RenderType" = "Opaque" }
  Cull Off
  GpuProgramID 28652
}
}
}