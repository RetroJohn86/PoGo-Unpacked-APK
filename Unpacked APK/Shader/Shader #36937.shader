//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_LargeOuterCol ("Large Circle Outer Color", Color) = (0.38,0.47,0.518,1)
_SmallInnerCol ("Small Circle Inner Color", Color) = (0.38,0.47,0.518,1)
_SmallOuterCol ("Small Circle Outer Color", Color) = (0.22,0.7,0.611,1)
_ShowSmallCircle ("Show Small Circle", Float) = 1
_SmallCircleRadius ("Small Circle Scale", Float) = 0.15
_SmallCircleOutline ("Small Circle Outline", Float) = 0.04
_SmallCircleXOffset ("Small X Offset", Float) = 0.2
_SmallCircleYOffset ("Small Y Offset", Float) = 0.8
}
SubShader {
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 42423
}
}
}