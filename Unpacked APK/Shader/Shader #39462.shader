//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_yFaceColor ("Up Facing Color", Color) = (1,1,1,1)
_blendedFaceColor ("Blended (distant) Face Color", Color) = (1,1,1,1)
_wallColor ("Wall Color 1", Color) = (1,1,1,1)
_wallColorSecondary ("Wall Color 2", Color) = (1,1,1,1)
_NearOpacity ("Near Opacity", Range(0, 1)) = 0
_FarOpacity ("Far Opacity", Range(0, 1)) = 1
_NearDist ("Near Distance", Float) = 100
_FarDist ("Far Distance", Float) = 250
_BlendedColorNearDist ("Blended Near Distance", Float) = 80
_BlendedColorFarDist ("Blended Far Distance", Float) = 250
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-1" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 25757
}
}
}