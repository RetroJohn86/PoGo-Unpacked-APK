//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Image Texture", 2D) = "white" { }
[Header(Base Properties)] [Spacing(10)] _Color ("Tint", Color) = (1,1,1,1)
[Header(Animation Properties)] [Spacing(10)] _ScaleMin ("Scale Min Size", Float) = 0.8
_ScaleMax ("Scale Max Size", Float) = 1.2
_ScaleSpeed ("Scale Speed", Float) = 1
_Rotation ("Rotation Range", Range(-180, 180)) = 0
_RotateSpeed ("Rotate Speed", Float) = 1
_BobSpeed ("Bob Speed", Float) = 1
_BobAmount ("Bob Amount (Y)", Float) = 0.5
_PivotOffset ("Pivot Position Offset", Vector) = (0,0,0,1)
_Delay ("Delay", Float) = 0
_ScaleUVAmount ("UV Scale Amount", Float) = 0
_PowerAmount ("Power Amount", Float) = 0
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 48337
}
}
}