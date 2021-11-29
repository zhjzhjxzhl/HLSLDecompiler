// ---- Created with 3Dmigoto v1.2.45 on Mon Nov 29 15:56:32 2021

cbuffer HPixel_Buffer : register(b12)
{
  float4 g_TargetUvParam : packoffset(c0);
}

cbuffer CamParam_HPixel_Buffer : register(b13)
{
  float4 g_CameraParam : packoffset(c0);
  float4 g_CameraVec : packoffset(c1);
}

cbuffer InsatncingParamBuffer : register(b8)
{

  struct
  {
    float4 color;
  } g_InstancingExParams[128] : packoffset(c0);

}

cbuffer PSParamBuffer1 : register(b2)
{
  float4 g_lightColor : packoffset(c0);
  float4 g_lightVec : packoffset(c1);
  float4 g_FogParam : packoffset(c2);
  float4 g_ScreenTileSize : packoffset(c3);
  float4 g_SpParam : packoffset(c4);
  uint4 g_spotShadowNo : packoffset(c5);
  float4 g_ScreenTileOffset : packoffset(c6);
  float4 g_FogColor : packoffset(c7);
}

cbuffer MeshBuffer1 : register(b3)
{
  float4 g_Category : packoffset(c0);
  float4 g_UvOffset : packoffset(c1);
  float4 g_ShadowParam : packoffset(c2);
  float4 g_wetLv1 : packoffset(c3);
  float4 g_wetLv2 : packoffset(c4);
  float4 g_UvOffsetDN : packoffset(c5);
}

cbuffer ModelBuffer : register(b4)
{
  float4 g_MeshColor : packoffset(c0);
}

cbuffer SH : register(b6)
{
  float4 g_R_Coeffs : packoffset(c0);
  float4 g_G_Coeffs : packoffset(c1);
  float4 g_B_Coeffs : packoffset(c2);
  float4 g_CubeBlendRate : packoffset(c3);
  float4 g_ExCubeParam : packoffset(c4);
  float4x4 g_WorldToUvw : packoffset(c5);
}

cbuffer PSParamBuffer1_1 : register(b1)
{
  float4 g_BaseBoolParam1 : packoffset(c0);
  float4 g_BaseBoolParam2 : packoffset(c1);
  float4 g_DetailParam : packoffset(c2);
  float4 g_EnvBoolParam : packoffset(c3);
  float4 g_AlbedoColor : packoffset(c4);
  float4 g_OtherPram : packoffset(c5);
  float4 g_WetParam1 : packoffset(c6);
}

SamplerState g_Texture0Sampler_s : register(s0);
SamplerState g_Texture1Sampler_s : register(s1);
SamplerState g_Texture2Sampler_s : register(s2);
SamplerState g_Texture3Sampler_s : register(s3);
SamplerState g_Texture4Sampler_s : register(s4);
SamplerState g_Texture5Sampler_s : register(s5);
SamplerState g_Texture11Sampler_s : register(s11);
SamplerState g_FogLUTSampler_s : register(s12);
Texture2D<float4> g_Texture0 : register(t0);
Texture2D<float4> g_Texture1 : register(t1);
Texture2D<float4> g_Texture2 : register(t2);
Texture2D<float4> g_Texture3 : register(t3);
Texture2D<float4> g_Texture4 : register(t4);
Texture2D<float4> g_Texture11 : register(t11);
TextureCube<float4> g_FogLUT : register(t12);
Texture2D<float4> g_AO_Texture : register(t17);
TextureCubeArray<float4> g_CubeTexArray : register(t18);
TextureCube<float4> g_BeforeFogLUT : register(t19);
StructuredBuffer<g_PointLightAryBuffer> g_PointLightAryBuffer : register(t20);
StructuredBuffer<g_PerTileLightIndexBuffer> g_PerTileLightIndexBuffer : register(t21);
StructuredBuffer<g_SpotLightAryBuffer> g_SpotLightAryBuffer : register(t22);
StructuredBuffer<g_CubePixelBuffer> g_CubePixelBuffer : register(t25);


// 3Dmigoto declarations
#define cmp -
Texture1D<float4> IniParams : register(t120);
Texture2D<float4> StereoParams : register(t125);


void main( 
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  float4 v3 : TEXCOORD2,
  float4 v4 : TEXCOORD3,
  out float4 o0 : SV_Target0)
{
// Needs manual fix for instruction: 
// unknown dcl_: dcl_resource_structured t20, 48
// Needs manual fix for instruction: 
// unknown dcl_: dcl_resource_structured t21, 4
// Needs manual fix for instruction: 
// unknown dcl_: dcl_resource_structured t22, 80
// Needs manual fix for instruction: 
// unknown dcl_: dcl_resource_structured t25, 32
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyz = v4.zxy * v3.yzx;
  r0.xyz = v4.yzx * v3.zxy + -r0.xyz;
  r0.w = (uint)v3.w;
  r1.xyz = g_InstancingExParams[r0.w].color.xyz * g_MeshColor.xyz;
    g_Texture0.GetDimensions(stride=48)(mixed);
    g_Texture0.GetDimensions(stride=80)(mixed);
  r2.xyz = g_CameraVec.xyz + -v2.xyz;
  r2.w = dot(r2.xyz, r2.xyz);
  r3.x = rsqrt(r2.w);
  r3.yzw = r3.xxx * r2.xyz;
  r4.xy = v0.xy / g_TargetUvParam.zw;
  r5.xyz = cmp(float3(0,0,0) != g_EnvBoolParam.zyx);
  if (r5.x != 0) {
    r4.zw = v1.zw;
  } else {
    r4.zw = v1.xy;
  }
  r6.xyzw = g_UvOffset.xyxy + v1.xyzw;
  r7.xyzw = g_Texture0.Sample(g_Texture0Sampler_s, r6.xy).xyzw;
  r4.zw = g_UvOffset.xy + r4.zw;
  r8.xyzw = g_Texture2.Sample(g_Texture2Sampler_s, r4.zw).zxyw;
  r9.xyz = g_Texture1.Sample(g_Texture1Sampler_s, r6.zw).xyz;
  r10.xyzw = g_Texture11.Sample(g_Texture11Sampler_s, r4.xy).zxyw;
  r4.z = cmp(g_BaseBoolParam1.x != 0.000000);
  if (r4.z != 0) {
    r6.xyz = g_Texture3.Sample(g_Texture3Sampler_s, r6.xy).xyz;
    r6.xyz = float3(-0.5,-0.5,-0.5) + r6.xyz;
  } else {
    r6.xyz = float3(0,0,0.5);
  }
  r4.z = cmp(g_DetailParam.z != 0.000000);
  if (r4.z != 0) {
    r4.zw = v1.zw * g_DetailParam.xy + g_UvOffset.xy;
    r4.zw = g_Texture4.Sample(g_Texture4Sampler_s, r4.zw).xy;
    r4.zw = r4.zw * float2(2,2) + float2(-1,-1);
    r6.xy = r4.zw * r8.ww + r6.xy;
  }
  r4.z = v4.w * r6.x;
  r6.xyw = -r6.yyy * r0.xyz;
  r6.xyw = r4.zzz * v4.xyz + r6.xyw;
  r6.xyz = r6.zzz * v3.xyz + r6.xyw;
  r4.z = dot(r6.xyz, r6.xyz);
  r4.z = rsqrt(r4.z);
  r6.xyz = r6.xyz * r4.zzz;
  if (r5.y != 0) {
    r8.x = r9.y * r8.x;
  }
  r5.xyw = cmp(float3(0,0,0) != g_BaseBoolParam1.yzw);
  if (r5.x != 0) {
    r7.xyz = g_AlbedoColor.xyz;
  }
  if (r5.y != 0) {
    r8.z = g_OtherPram.x;
  }
  if (r5.w != 0) {
    r8.y = g_OtherPram.y;
  }
  r4.x = g_AO_Texture.Sample(g_Texture11Sampler_s, r4.xy).x;
  r4.x = saturate(g_ShadowParam.z + r4.x);
  r4.xyz = r7.xyz * r4.xxx;
  r5.xyw = r4.xyz * r1.xyz;
  r4.w = 1 + -r8.z;
  r7.x = 1 + -r8.y;
  r11.xyz = r7.xxx * r5.xyw;
  r12.xyz = r4.xyz * r1.xyz + float3(-0.0299999993,-0.0299999993,-0.0299999993);
  r12.xyz = r8.yyy * r12.xyz + float3(0.0299999993,0.0299999993,0.0299999993);
  r13.xyz = g_Category.www * g_lightColor.xyz;
  r7.y = saturate(dot(r6.xyz, g_lightVec.xyz));
  r7.z = dot(r6.xyz, r3.yzw);
  r8.z = saturate(r7.z);
  r14.xyz = r2.xyz * r3.xxx + g_lightVec.xyz;
  r8.w = dot(r14.xyz, r14.xyz);
  r8.w = rsqrt(r8.w);
  r14.xyz = r14.xyz * r8.www;
  r8.w = saturate(dot(r6.xyz, r14.xyz));
  r9.w = saturate(dot(g_lightVec.xyz, r14.xyz));
  r11.w = r4.w * r4.w;
  r12.w = v4.x + r0.x;
  r12.w = r12.w * 9.99999997e-07 + r11.w;
  r12.w = max(0.00100000005, r12.w);
  r1.xyz = r4.xyz * r1.xyz + float3(-0.0799999982,-0.0799999982,-0.0799999982);
  r1.xyz = r8.yyy * r1.xyz + float3(0.0799999982,0.0799999982,0.0799999982);
  r4.x = 1 + -r7.y;
  r4.y = r4.x * r4.x;
  r4.y = r4.y * r4.y;
  r4.x = r4.y * r4.x;
  r4.y = 1 + -r8.z;
  r4.z = r4.y * r4.y;
  r4.z = r4.z * r4.z;
  r4.y = r4.z * r4.y;
  r4.z = r9.w * r9.w;
  r4.z = dot(r4.zz, r12.ww);
  r4.z = -0.5 + r4.z;
  r4.x = r4.x * r4.z + 1;
  r4.z = r4.y * r4.z + 1;
  r4.x = r4.x * r4.z;
  r4.z = r12.w * r12.w;
  r8.y = r8.w * r8.w;
  r8.w = r12.w * r12.w + -1;
  r8.y = r8.y * r8.w + 1;
  r8.y = r8.y * r8.y;
  r8.y = 3.14159274 * r8.y;
  r8.y = r4.z / r8.y;
  r9.w = 1 + -r9.w;
  r13.w = r9.w * r9.w;
  r13.w = r13.w * r13.w;
  r9.w = r13.w * r9.w;
  r14.xyz = float3(1,1,1) + -r1.xyz;
  r15.xyz = r9.www * r14.xyz + r1.xyz;
  r9.w = r12.w * 0.5 + 0.5;
  r9.w = r9.w * r9.w;
  r13.w = r9.w * r9.w;
  r14.w = r7.y * r7.y;
  r15.w = r9.w * r9.w + r14.w;
  r14.w = -r13.w * r14.w + r15.w;
  r14.w = sqrt(r14.w);
  r14.w = r14.w + r7.y;
  r14.w = 1 / r14.w;
  r15.w = r8.z * r8.z;
  r16.x = r9.w * r9.w + r15.w;
  r15.w = -r13.w * r15.w + r16.x;
  r15.w = sqrt(r15.w);
  r8.z = r15.w + r8.z;
  r8.z = 1 / r8.z;
  r14.w = r14.w * r8.z;
  r4.x = 0.318309873 * r4.x;
  r16.xyz = r4.xxx * r5.xyw;
  r15.xyz = r14.www * r15.xyz;
  r15.xyz = r15.xyz * r8.yyy;
  r15.xyz = r16.xyz * r7.xxx + r15.xyz;
  r15.xyz = r15.xyz * r7.yyy;
  r13.xyz = r15.xyz * r13.xyz;
  r15.xy = g_ScreenTileSize.zw * v0.xy;
  r15.xy = (uint2)r15.xy;
  r15.xy = (uint2)r15.xy;
  r4.x = r15.y * g_ScreenTileSize.x + r15.x;
  r0.w = (int)r0.w + 2;
  r0.w = (uint)r0.w;
  r0.w = r4.x * r0.w;
  r0.w = (uint)r0.w;
// Known bad code for instruction (needs manual fix):
ld_structured_indexable(structured_buffer, stride=4)(mixed,mixed,mixed,mixed) r4.x, r0.w, l(0), t21.xxxx
r4.x = g_Texture0Sampler[]..swiz;
  r15.xyzw = float4(0,0,0,0);
  r7.y = 0;
  r8.y = r4.x;
  while (true) {
    r14.w = cmp((int)r8.y == 0x0000ffff);
    if (r14.w != 0) break;
  // Known bad code for instruction (needs manual fix):
    ld_structured_indexable(structured_buffer, stride=48)(mixed,mixed,mixed,mixed) r16.xyzw, r8.y, l(28), t20.xyzw
  r16.x = g_Texture0Sampler[]..swiz;
  r16.y = g_Texture0Sampler[]..swiz;
  r16.z = g_Texture0Sampler[]..swiz;
  r16.w = g_Texture0Sampler[]..swiz;
    r14.w = cmp(r16.x >= 0);
    r16.x = cmp(r16.x != g_Category.z);
    r14.w = r14.w ? r16.x : 0;
    if (r14.w != 0) {
      r7.y = (int)r7.y + 1;
      r14.w = (int)r0.w + (int)r7.y;
    // Known bad code for instruction (needs manual fix):
        ld_structured_indexable(structured_buffer, stride=4)(mixed,mixed,mixed,mixed) r14.w, r14.w, l(0), t21.xxxx
    r14.w = g_Texture0Sampler[]..swiz;
      r8.y = r14.w;
      continue;
    }
  // Known bad code for instruction (needs manual fix):
    ld_structured_indexable(structured_buffer, stride=48)(mixed,mixed,mixed,mixed) r17.xyzw, r8.y, l(0), t20.xyzw
  r17.x = g_Texture0Sampler[]..swiz;
  r17.y = g_Texture0Sampler[]..swiz;
  r17.z = g_Texture0Sampler[]..swiz;
  r17.w = g_Texture0Sampler[]..swiz;
  // Known bad code for instruction (needs manual fix):
    ld_structured_indexable(structured_buffer, stride=48)(mixed,mixed,mixed,mixed) r14.w, r8.y, l(44), t20.xxxx
  r14.w = g_Texture0Sampler[]..swiz;
    r17.xyz = -v2.xyz + r17.xyz;
    r16.x = dot(r17.xyz, r17.xyz);
    r18.x = rsqrt(r16.x);
    r18.yzw = r18.xxx * r17.xyz;
    r16.x = sqrt(r16.x);
    r16.x = r16.x + -r14.w;
    r14.w = r17.w + -r14.w;
    r14.w = saturate(r16.x / r14.w);
    r14.w = 1 + -r14.w;
    r14.w = r14.w * r14.w;
    r16.x = cmp(r16.y < 0);
    r17.w = saturate(dot(r6.xyz, r18.yzw));
    r19.x = r17.w * r14.w;
    r19.w = -r19.x * r16.y + r15.w;
    r17.xyz = r17.xyz * r18.xxx + r3.yzw;
    r18.x = dot(r17.xyz, r17.xyz);
    r18.x = rsqrt(r18.x);
    r17.xyz = r18.xxx * r17.xyz;
    r18.x = saturate(dot(r6.xyz, r17.xyz));
    r17.x = saturate(dot(r18.yzw, r17.xyz));
    r17.y = 1 + -r17.w;
    r17.z = r17.y * r17.y;
    r17.z = r17.z * r17.z;
    r17.y = r17.z * r17.y;
    r17.z = r17.x * r17.x;
    r17.z = dot(r17.zz, r12.ww);
    r17.z = -0.5 + r17.z;
    r17.y = r17.y * r17.z + 1;
    r17.z = r4.y * r17.z + 1;
    r17.y = r17.y * r17.z;
    r17.z = r18.x * r18.x;
    r17.z = r17.z * r8.w + 1;
    r17.z = r17.z * r17.z;
    r17.yz = float2(0.318309873,3.14159274) * r17.yz;
    r17.z = r4.z / r17.z;
    r17.x = 1 + -r17.x;
    r18.x = r17.x * r17.x;
    r18.x = r18.x * r18.x;
    r17.x = r18.x * r17.x;
    r18.xyz = r17.xxx * r14.xyz + r1.xyz;
    r17.x = r17.w * r17.w;
    r18.w = r9.w * r9.w + r17.x;
    r17.x = -r13.w * r17.x + r18.w;
    r17.x = sqrt(r17.x);
    r17.x = r17.w + r17.x;
    r17.x = 1 / r17.x;
    r17.x = r17.x * r8.z;
    r20.xyz = r17.yyy * r5.xyw;
    r18.xyz = r17.xxx * r18.xyz;
    r17.xyz = r18.xyz * r17.zzz;
    r17.xyz = r20.xyz * r7.xxx + r17.xyz;
    r17.xyz = r17.xyz * r17.www;
    r16.yzw = r17.xyz * r16.yzw;
    r17.xyz = r16.yzw * r14.www + r15.xyz;
    r19.xyz = r15.xyz;
    r17.w = r15.w;
    r15.xyzw = r16.xxxx ? r19.xyzw : r17.xyzw;
    r7.y = (int)r7.y + 1;
    r14.w = (int)r0.w + (int)r7.y;
  // Known bad code for instruction (needs manual fix):
    ld_structured_indexable(structured_buffer, stride=4)(mixed,mixed,mixed,mixed) r8.y, r14.w, l(0), t21.xxxx
  r8.y = g_Texture0Sampler[]..swiz;
  }
  r0.w = cmp(0 < g_ShadowParam.x);
  r16.xyz = float3(0,0,0);
  r4.x = 0;
  while (true) {
    r7.y = cmp((uint)r4.x >= (uint)r1.w);
    if (r7.y != 0) break;
  // Known bad code for instruction (needs manual fix):
    ld_structured_indexable(structured_buffer, stride=80)(mixed,mixed,mixed,mixed) r17.xyzw, r4.x, l(28), t22.xyzw
  r17.x = g_Texture0Sampler[]..swiz;
  r17.y = g_Texture0Sampler[]..swiz;
  r17.z = g_Texture0Sampler[]..swiz;
  r17.w = g_Texture0Sampler[]..swiz;
    r7.y = cmp(r17.x >= 0);
    r8.y = cmp(r17.x != g_Category.z);
    r7.y = r7.y ? r8.y : 0;
    if (r7.y != 0) {
      r7.y = (int)r4.x + 1;
      r4.x = r7.y;
      continue;
    } else {
      r7.y = r4.x;
    }
  // Known bad code for instruction (needs manual fix):
    ld_structured_indexable(structured_buffer, stride=80)(mixed,mixed,mixed,mixed) r18.xyzw, r4.x, l(0), t22.xyzw
  r18.x = g_Texture0Sampler[]..swiz;
  r18.y = g_Texture0Sampler[]..swiz;
  r18.z = g_Texture0Sampler[]..swiz;
  r18.w = g_Texture0Sampler[]..swiz;
  // Known bad code for instruction (needs manual fix):
    ld_structured_indexable(structured_buffer, stride=80)(mixed,mixed,mixed,mixed) r19.xyzw, r4.x, l(44), t22.xyzw
  r19.x = g_Texture0Sampler[]..swiz;
  r19.y = g_Texture0Sampler[]..swiz;
  r19.z = g_Texture0Sampler[]..swiz;
  r19.w = g_Texture0Sampler[]..swiz;
    r18.xyz = -v2.xyz + r18.xyz;
    r8.y = dot(r18.xyz, r18.xyz);
    r14.w = rsqrt(r8.y);
    r18.xyz = r18.xyz * r14.www;
    r14.w = dot(r18.xyz, r19.yzw);
    r14.w = max(0, r14.w);
    r16.w = cmp(r18.w < r14.w);
    if (r16.w != 0) {
    // Known bad code for instruction (needs manual fix):
        ld_structured_indexable(structured_buffer, stride=80)(mixed,mixed,mixed,mixed) r18.xy, r4.x, l(64), t22.xyxx
    r18.x = g_Texture0Sampler[]..swiz;
    r18.y = g_Texture0Sampler[]..swiz;
      if (r0.w != 0) {
        r20.xyzw = cmp((int4)g_spotShadowNo.xyzw == (int4)r7.yyyy);
        if (r20.x != 0) {
          r16.w = r10.y;
        } else {
          r16.w = 1;
        }
        if (r20.y != 0) {
          r16.w = r10.z;
        }
        if (r20.z != 0) {
          r16.w = r10.x;
        }
        if (r20.w != 0) {
          r16.w = r10.w;
        }
      } else {
        r16.w = 1;
      }
      r14.w = saturate(r14.w + -r18.w);
      r14.w = saturate(r14.w * r19.x);
      r8.y = sqrt(r8.y);
      r8.y = saturate(r8.y * r18.x);
      r8.y = 1 + -r8.y;
      r8.y = saturate(r8.y * r18.y);
      r14.w = r14.w * r14.w;
      r8.y = r8.y * r8.y;
      r8.y = r14.w * r8.y;
      r14.w = saturate(dot(r6.xyz, r19.yzw));
      r18.xyz = r2.xyz * r3.xxx + r19.yzw;
      r17.x = dot(r18.xyz, r18.xyz);
      r17.x = rsqrt(r17.x);
      r18.xyz = r18.xyz * r17.xxx;
      r17.x = saturate(dot(r6.xyz, r18.xyz));
      r18.x = saturate(dot(r19.yzw, r18.xyz));
      r18.y = 1 + -r14.w;
      r18.z = r18.y * r18.y;
      r18.z = r18.z * r18.z;
      r18.y = r18.z * r18.y;
      r18.z = r18.x * r18.x;
      r18.z = dot(r18.zz, r12.ww);
      r18.z = -0.5 + r18.z;
      r18.y = r18.y * r18.z + 1;
      r18.z = r4.y * r18.z + 1;
      r18.y = r18.y * r18.z;
      r17.x = r17.x * r17.x;
      r17.x = r17.x * r8.w + 1;
      r17.x = r17.x * r17.x;
      r17.x = 3.14159274 * r17.x;
      r17.x = r4.z / r17.x;
      r18.x = 1 + -r18.x;
      r18.z = r18.x * r18.x;
      r18.z = r18.z * r18.z;
      r18.x = r18.z * r18.x;
      r18.xzw = r18.xxx * r14.xyz + r1.xyz;
      r19.x = r14.w * r14.w;
      r19.y = r9.w * r9.w + r19.x;
      r19.x = -r13.w * r19.x + r19.y;
      r19.x = sqrt(r19.x);
      r19.x = r19.x + r14.w;
      r19.x = 1 / r19.x;
      r19.x = r19.x * r8.z;
      r18.y = 0.318309873 * r18.y;
      r19.yzw = r18.yyy * r5.xyw;
      r18.xyz = r19.xxx * r18.xzw;
      r18.xyz = r18.xyz * r17.xxx;
      r18.xyz = r19.yzw * r7.xxx + r18.xyz;
      r18.xyz = r18.xyz * r14.www;
      r17.xyz = r18.xyz * r17.yzw;
      r17.xyz = r17.xyz * r8.yyy;
      r16.xyz = r17.xyz * r16.www + r16.xyz;
    }
    r4.x = (int)r7.y + 1;
  }
  if (r0.w != 0) {
    r10.x = 1;
  }
  r1.xyz = r13.xyz * r10.xxx;
  if (r5.z != 0) {
    r1.xyz = r1.xyz * r9.xyz;
  }
  r2.xyz = r16.xyz + r15.xyz;
  r1.xyz = r2.xyz + r1.xyz;
  r2.xy = (uint2)v0.xy;
  r0.w = (uint)g_TargetUvParam.z;
  r0.w = mad((int)r2.y, (int)r0.w, (int)r2.x);
// Known bad code for instruction (needs manual fix):
ld_structured_indexable(structured_buffer, stride=32)(mixed,mixed,mixed,mixed) r9.xw, r0.w, l(0), t25.xxxy
r9.x = g_Texture0Sampler[]..swiz;
r9.w = g_Texture0Sampler[]..swiz;
// Known bad code for instruction (needs manual fix):
ld_structured_indexable(structured_buffer, stride=32)(mixed,mixed,mixed,mixed) r2.xy, r0.w, l(16), t25.xyxx
r2.x = g_Texture0Sampler[]..swiz;
r2.y = g_Texture0Sampler[]..swiz;
  r0.w = dot(v4.xyz, r6.xyz);
  r4.xyz = -r6.xyz * r0.www + v4.xyz;
  r0.w = dot(r4.xyz, r4.xyz);
  r0.w = rsqrt(r0.w);
  r4.xyz = r4.xyz * r0.www;
  r0.w = dot(r0.xyz, r6.xyz);
  r8.yzw = -r6.xyz * r0.www + r0.xyz;
  r0.x = dot(r0.xyz, r4.xyz);
  r0.xyz = -r4.xyz * r0.xxx + r8.yzw;
  r0.w = dot(r0.xyz, r0.xyz);
  r0.w = rsqrt(r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.w = r11.w * r11.w + -1;
  r1.w = r0.w * -2.44929371e-16 + 1;
  r1.w = 1 / r1.w;
  r1.w = sqrt(r1.w);
  r2.z = -r1.w * r1.w + 1;
  r2.z = max(0, r2.z);
  r2.z = sqrt(r2.z);
  r3.x = -2.44929371e-16 * r2.z;
  r0.xyz = r3.xxx * r0.xyz;
  r0.xyz = r2.zzz * r4.xyz + r0.xyz;
  r0.xyz = r1.www * r6.xyz + r0.xyz;
  r1.w = dot(r0.xyz, r0.xyz);
  r1.w = rsqrt(r1.w);
  r0.xyz = r1.www * r0.xyz;
  r1.w = dot(r3.yzw, r0.xyz);
  r2.z = r1.w + r1.w;
  r4.xyz = r0.xyz * -r2.zzz + r3.yzw;
  r10.xyz = -r4.xyz;
  r1.w = max(9.99999994e-09, r1.w);
  r0.x = dot(r6.xyz, r0.xyz);
  r0.x = max(9.99999994e-09, r0.x);
  r0.y = cmp(r4.w < 0.00999999978);
  r0.z = r0.x * r0.x;
  r0.z = r0.z * r0.w + 1;
  r0.z = max(9.99999994e-09, r0.z);
  r0.z = r11.w / r0.z;
  r0.z = r0.z * r0.z;
  r0.x = r0.z * r0.x;
  r0.x = 0.318309873 * r0.x;
  r0.z = 4 * r1.w;
  r0.x = r0.x / r0.z;
  r0.z = -r4.y * r4.y + 1;
  r0.z = sqrt(r0.z);
  r0.x = r0.x * r0.z;
  r0.x = log2(r0.x);
  r0.x = -r0.x * 0.5 + 4.5;
  r0.x = max(0, r0.x);
  r0.x = r0.y ? 0 : r0.x;
  r10.w = r9.x;
  r0.yzw = g_CubeTexArray.SampleLevel(g_Texture5Sampler_s, r10.xyzw, r0.x).xyz;
  r9.xyz = r10.xyz;
  r4.xyz = g_CubeTexArray.SampleLevel(g_Texture5Sampler_s, r9.xyzw, r0.x).xyz;
  r4.xyz = r4.xyz * r2.yyy;
  r0.x = 1 + r7.z;
  r0.x = max(0, r0.x);
  r1.w = 1 + -r4.w;
  r0.x = log2(r0.x);
  r0.x = r1.w * r0.x;
  r0.x = exp2(r0.x);
  r0.x = min(1, r0.x);
  r7.xyz = r12.xyz * r0.xxx;
  r0.xyz = r0.yzw * r2.xxx + r4.xyz;
  r0.w = dot(g_R_Coeffs.yzw, g_R_Coeffs.yzw);
  r1.w = sqrt(r0.w);
  r0.w = rsqrt(r0.w);
  r4.xyz = g_R_Coeffs.yzw * r0.www;
  r0.w = dot(r6.xyz, r4.xyz);
  r0.w = 1 + r0.w;
  r0.w = 0.5 * r0.w;
  r2.z = r0.w * r0.w;
  r3.x = r1.w + r1.w;
  r1.w = g_R_Coeffs.x + r1.w;
  r1.w = r3.x / r1.w;
  r1.w = g_R_Coeffs.x * r1.w;
  r0.w = dot(r2.zz, r0.ww);
  r0.w = -r2.z * r2.z + r0.w;
  r0.w = r0.w * 3.33333325 + -1;
  r4.x = r1.w * r0.w + g_R_Coeffs.x;
  r0.w = dot(g_G_Coeffs.yzw, g_G_Coeffs.yzw);
  r1.w = sqrt(r0.w);
  r0.w = rsqrt(r0.w);
  r8.yzw = g_G_Coeffs.yzw * r0.www;
  r0.w = dot(r6.xyz, r8.yzw);
  r0.w = 1 + r0.w;
  r0.w = 0.5 * r0.w;
  r2.z = r0.w * r0.w;
  r3.x = r1.w + r1.w;
  r1.w = g_G_Coeffs.x + r1.w;
  r1.w = r3.x / r1.w;
  r1.w = g_G_Coeffs.x * r1.w;
  r0.w = dot(r2.zz, r0.ww);
  r0.w = -r2.z * r2.z + r0.w;
  r0.w = r0.w * 3.33333325 + -1;
  r4.y = r1.w * r0.w + g_G_Coeffs.x;
  r0.w = dot(g_B_Coeffs.yzw, g_B_Coeffs.yzw);
  r1.w = sqrt(r0.w);
  r0.w = rsqrt(r0.w);
  r8.yzw = g_B_Coeffs.yzw * r0.www;
  r0.w = dot(r6.xyz, r8.yzw);
  r0.w = 1 + r0.w;
  r0.w = 0.5 * r0.w;
  r2.z = r0.w * r0.w;
  r3.x = r1.w + r1.w;
  r1.w = g_B_Coeffs.x + r1.w;
  r1.w = r3.x / r1.w;
  r1.w = g_B_Coeffs.x * r1.w;
  r0.w = dot(r2.zz, r0.ww);
  r0.w = -r2.z * r2.z + r0.w;
  r0.w = r0.w * 3.33333325 + -1;
  r4.z = r1.w * r0.w + g_B_Coeffs.x;
  r4.xyz = max(float3(0,0,0), r4.xyz);
  r4.xyz = r4.xyz * r5.xyw;
  r1.xyz = r4.xyz * g_CubeBlendRate.xxx + r1.xyz;
  r6.w = r10.w;
  r4.xyz = g_CubeTexArray.SampleLevel(g_Texture0Sampler_s, r6.xyzw, 5).xyz;
  r4.xyz = r4.xyz * r2.xxx;
  r9.xyz = r6.xyz;
  r5.xyz = g_CubeTexArray.SampleLevel(g_Texture0Sampler_s, r9.xyzw, 5).xyz;
  r2.xyz = r5.xyz * r2.yyy;
  r2.xyz = g_CubeBlendRate.yyy * r2.xyz;
  r2.xyz = r4.xyz * g_CubeBlendRate.yyy + r2.xyz;
  r1.xyz = r11.xyz * r2.xyz + r1.xyz;
  r0.xyz = r0.xyz * r7.xyz + r1.xyz;
  r15.w = saturate(r15.w);
  r0.w = -r15.w * g_Category.x + 1;
  r0.w = saturate(r8.x * r0.w);
  r0.xyz = r0.xyz * r0.www;
  r0.w = sqrt(r2.w);
  r0.w = -g_FogParam.x + r0.w;
  r0.w = saturate(g_FogParam.y * r0.w);
  r0.w = log2(r0.w);
  r0.w = g_FogParam.z * r0.w;
  r0.w = exp2(r0.w);
  r1.xyz = -r3.yzw;
  r2.xyzw = g_FogLUT.Sample(g_FogLUTSampler_s, r1.xyz).xyzw;
  r1.xyzw = g_BeforeFogLUT.Sample(g_FogLUTSampler_s, r1.xyz).xyzw;
  r2.xyzw = r2.xyzw + -r1.xyzw;
  r1.xyzw = g_SpParam.wwww * r2.xyzw + r1.xyzw;
  r0.w = r1.w * r0.w;
  r1.xyz = r1.xyz * g_FogColor.xyz + -r0.xyz;
  o0.xyz = r0.www * r1.xyz + r0.xyz;
  o0.w = r7.w;
  return;
}