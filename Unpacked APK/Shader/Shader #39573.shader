//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_Boost ("Boost", Float) = 0
_FogBias ("fogBias", Range(0, 10)) = 0
_OrbitRadius ("OrbitRadius", Float) = 1
_SpriteScale ("Sprite Scale", Float) = 1
_ScaleInOutSpeed ("Scale In/Out Speed", Float) = 0.25
_OrbitSpeed ("Orbit Speed", Float) = 0.25
_PhaseOffset ("Phase Offset", Float) = 0
_Alpha ("Alpha", Float) = 1
}
SubShader {
 Pass {
  Name "FORWARD"
  Tags { "CanUseSpriteAtlas" = "true" "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  Blend One One, One One
  ZWrite Off
  GpuProgramID 29517
}
}
}