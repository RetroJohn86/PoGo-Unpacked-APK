//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture 1", 2D) = "white" { }
_Tex2 ("Texture 2", 2D) = "white" { }
_PanSpeeds ("Pan Speeds: (XY=Tex1, ZW=Tex2)", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 37093
}
}
}