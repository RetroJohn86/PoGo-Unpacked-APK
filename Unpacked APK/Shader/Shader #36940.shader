//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_DetailTex ("Detail Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Culling Mode (None = double-sided)", Float) = 2
_PanningSpeed ("Panning Speed", Vector) = (0,0,0,0)
_FresnelScale ("Fresnel Scale", Float) = 1
_FresnelPower ("Fresnel Power", Float) = 1
_VertexNoise ("Vertex Noise", Float) = 0
_VertexSpeed ("Vertex Speed", Float) = 1
_VertexFrequency ("Vertex Frequency", Float) = 1
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 48052
}
}
}