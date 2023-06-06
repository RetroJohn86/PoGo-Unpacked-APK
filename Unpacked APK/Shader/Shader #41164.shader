//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Overlay Texture", 2D) = "white" { }
_ScaleAndOffset ("scale and offset", Vector) = (1,1,0,0)
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha DstAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 49270
}
}
}