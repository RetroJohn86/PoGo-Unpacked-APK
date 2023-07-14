//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
_TintColor ("Tint Color", Color) = (1,1,1,1)
_Edge ("Edge", Range(0, 1)) = 0.2
[Enum(UnityEngine.Rendering.CompareFunction)] _ZComp ("Z Compare Function", Float) = 0
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 56758
}
}
}