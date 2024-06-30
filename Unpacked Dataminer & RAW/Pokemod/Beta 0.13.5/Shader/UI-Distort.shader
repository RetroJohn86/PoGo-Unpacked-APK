//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Holo/Distort Base" {
Properties {
 _MainTex ("Base (RGBA)", 2D) = "white" { }
 _DistortMap ("Distort Map (RG,BA)", 2D) = "gray" { }
[Toggle(BRB_SCROLL)]  _Scroll ("    Only RG", Float) = 0
 _DistortionAmount ("Distortion Amount", Range(-2,2)) = 0
 _Speed ("Distortion Speed (Distort Map RG.uv, Distort Map BA.uv)", Vector) = (0,0,0,0)
[Enum(UnityEngine.Rendering.CompareFunction)]  _StencilComp ("Stencil Comparison", Float) = 8
 _Stencil ("Stencil ID", Float) = 0
[Enum(UnityEngine.Rendering.StencilOp)]  _StencilOp ("Stencil Operation", Float) = 0
 _StencilWriteMask ("Stencil Write Mask", Float) = 255
 _StencilReadMask ("Stencil Read Mask", Float) = 255
[Enum(UnityEngine.Rendering.ColorWriteMask)]  _ColorMask ("Color Mask", Float) = 15
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="true" }
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="true" }
  ZTest [unity_GUIZTestMode]
  ZWrite Off
  Cull Off
  Stencil {
   Ref [_Stencil]
   ReadMask [_StencilReadMask]
   WriteMask [_StencilWriteMask]
   Comp [_StencilComp]
   Pass [_StencilOp]
  }
  Blend SrcAlpha OneMinusSrcAlpha
  ColorMask [_ColorMask]
  GpuProgramID 34138
Program "vp" {
SubProgram "gles " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 glstate_matrix_mvp;
uniform lowp vec4 _Speed;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _DistortMap_ST;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  lowp vec4 tmpvar_2;
  lowp vec4 tmpvar_3;
  lowp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_5.zw = ((_glesMultiTexCoord0.xy * _DistortMap_ST.xy) + _DistortMap_ST.zw);
  tmpvar_3 = tmpvar_5;
  tmpvar_4 = (tmpvar_3.zwzw + (_Speed * _Time.y));
  tmpvar_2 = tmpvar_1;
  gl_Position = (glstate_matrix_mvp * _glesVertex);
  xlv_COLOR = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DistortMap;
uniform lowp float _DistortionAmount;
varying lowp vec4 xlv_COLOR;
varying lowp vec4 xlv_TEXCOORD0;
varying lowp vec4 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = (texture2D (_MainTex, (xlv_TEXCOORD0.xy + (
    ((texture2D (_DistortMap, xlv_TEXCOORD1.xy).xy - 0.5) + (texture2D (_DistortMap, xlv_TEXCOORD1.zw).zw - 0.5))
   * _DistortionAmount))) * xlv_COLOR);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles " {
""
}
}
 }
}
Fallback Off
}