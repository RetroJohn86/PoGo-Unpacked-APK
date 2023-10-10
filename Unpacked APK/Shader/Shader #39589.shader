//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_Color1 ("Color1", Color) = (1,0,0,1)
_Color2 ("Color2", Color) = (0,0.3793104,1,1)
[Toggle(NIANTIC_FX)] _ColorBlend ("ColorBlend", Float) = 1
_BlendPoint ("BlendPoint", Range(0, 1)) = 0.5
_AttenuationStart ("AttenuationStart", Range(0, 1)) = 1
_AttenuationEnd ("AttenuationEnd", Range(0, 1)) = 0
_Intensity ("Intensity", Range(0, 10)) = 1
_AnimInput ("AnimInput", Range(0, 5)) = 1
[Header(SORTING_AND_CULLING)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Culling", Float) = 2
[Toggle] _ZWrite ("Z Write", Float) = 0
[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("Z Test", Float) = 4
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One One, One One
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 2046
}
}
}