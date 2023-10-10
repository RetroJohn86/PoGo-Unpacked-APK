//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
[Space] [Header(PROPERTYBLOCK_SETTINGS_______________)] [Space] [Toggle(NIANTIC_MATERIAL_B)] _MaterialB ("Material Block B", Float) = 0
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_TintColor ("Tint Color", Color) = (1,1,1,1)
_SelfIllumination_A ("_SelfIllumination_A", Range(0, 2)) = 1
_Alpha_A ("_Alpha_A", Range(0, 1)) = 1
[KeywordEnum(NONE, RIM)] VERTEX_ALPHA ("VertexAlpha Rim", Float) = 0
[Space] [Header(BRDF_PROPERTIES_______________)] [Space] _Ramp2D ("BRDF Ramp", 2D) = "grey" { }
_Amount_Blend ("BRDF Amount", Range(0, 2)) = 1
_Amount_Wrap ("Lambert Wrap Amount", Range(0, 1)) = 0
_cDiff ("Diffuse", Color) = (1,1,1,0.5)
_cAmbn ("Ambient", Color) = (0,0,0,0.5)
_cKeyf ("Specular (.a=0.5)", Color) = (1,1,1,0.5)
_cRimt ("RimTop   (.a=0.5)", Color) = (1,1,0,0.5)
_cRimb ("RimBottom(.a=0.5)", Color) = (0.5,0.5,0.5,0.5)
_Amount_RimLt ("RimLight Mult", Range(0, 2)) = 1
_LightPos ("Light Position", Vector) = (0,0.5,1,0)
[Header(SORTING_AND_CULLING)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Culling", Float) = 2
[Toggle] _ZWrite ("Z Write", Float) = 0
[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("Z Test", Float) = 4
[Header(VARIANT_BLOCKS____________________)] [Space] _SelfIllumination_B ("_SelfIllumination_B", Range(0, 2)) = 1
_Alpha_B ("_Alpha_B", Range(0, 1)) = 1
}
SubShader {
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha DstAlpha
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 53816
}
}
}