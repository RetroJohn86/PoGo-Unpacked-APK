//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_FillAmt ("Fill Amount", Range(0, 1)) = 0
_FillColor ("FillColor", Color) = (0.38,0.47,0.518,1)
_Feather ("Feather", Float) = 0.005
_Scale ("Scale", Range(0, 1)) = 1
}
SubShader {
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 8034
}
}
}