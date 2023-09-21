//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_IconColor ("Icon Color", Color) = (1,1,1,1)
_IconOutlineColorA ("Icon Outline Color A", Color) = (1,1,1,1)
_IconOutlineColorB ("Icon Outline Color B", Color) = (1,1,1,1)
_IconDetailColor ("Icon Detail Color", Color) = (1,1,1,1)
_BorderColorA ("Border Color A", Color) = (1,1,1,1)
_BorderColorB ("Border Color A", Color) = (1,1,1,1)
_BackgroundColorA ("Background Color A", Color) = (1,1,1,1)
_BackgroundColorB ("Background Color B", Color) = (1,1,1,1)
_DetailColor ("Detail Color", Color) = (0,0,0,0)
_IconThreshold ("Icon Threshold", Range(0, 1)) = 0.5
_BorderThresholdA ("Border Threshold A", Range(0, 1)) = 0.5
_BorderThresholdB ("Border Threshold B", Range(0, 1)) = 0.5
[Toggle(USE_DETAIL_COLOR)] _UseDetailColor ("Use Detail Color", Float) = 0
}
SubShader {
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 51573
}
}
}