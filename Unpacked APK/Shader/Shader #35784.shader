//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
[Header(BLENDING (ShadowAlpha only works with some blend modes))] [Enum(UnityEngine.Rendering.BlendMode)] _Blend ("Blend mode", Float) = 2
[Enum(UnityEngine.Rendering.BlendMode)] _Blend2 ("Blend mode 2", Float) = 0
[Space] [Header(GENERAL PARAMETERS)] _ShadowDir ("Shadow Direction", Vector) = (-0.3,-0.3,0,1)
_Color ("Color", Color) = (0,0,0,1)
_GroundHeight ("Ground Height", Float) = 0
_ShadowAlpha ("Shadow Alpha", Range(0, 1)) = 1
_ShadowAngleHeightScale ("Shadow Angle Height Scale", Float) = 2
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Offset 0, -1
  Stencil {
   Ref 1
   ReadMask 1
   WriteMask 1
   Comp NotEqual
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 58358
}
}
}