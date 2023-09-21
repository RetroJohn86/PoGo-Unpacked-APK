//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_EdgeColor ("Edge Color", Color) = (1,1,1,0.4)
_EdgeWeight ("Edge Weight", Float) = 6
_LimitHit ("Limit Hit", Float) = 0
_UnfillColor ("Unfilled Color", Color) = (1,1,1,1)
_UnfillOuter ("Unfilled Outer", Range(0, 1)) = 0.5
_UnfilledOuterFeather ("Unfilled Outer Feather", Float) = 0.1
_UnfilledOuterThickness ("Unfilled Outer Thickness", Float) = 0.1
_FillAmt ("Fill Amount", Range(0, 1)) = 0
_TimerFillValue ("Attack Wait Fill Value", Range(0, 1)) = 0
_ScreenExtends ("Extends of Icon on Screen", Vector) = (0,0,1,1)
}
SubShader {
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+100" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 44961
}
}
}