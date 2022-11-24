Shader "Unlit/2" 
{
    Properties
    {
      _MainTex("Texture", 2D) = "white" {}
      _Color("Color", Color) = (0,0,0,1)
      _Outline("Range Color", Range(-1,2)) = 0.05
    }
    SubShader
    { 
          ZWrite off
          CGPROGRAM
          #pragma surface surf Lambert vertex:vert
          sampler2D _MainTex;
          float4 _Color;
          half _Outline;
          struct Input 
          {
                  float2 uv_MainTex;
          };
          struct appdata
          {
                  float4 vertex : POSITION;
                  float3 normal : NORMAL;
          };
          void vert(inout appdata_full v)
          {
                  v.vertex.xyz += v.normal * _Outline ;
          }
          void surf(Input IN, inout SurfaceOutput o)
          {
                  o.Emission = _Color.rgb;
          }
        ENDCG
        ZWrite on
        CGPROGRAM
        #pragma surface surf Lambert
        sampler2D _MainTex;
        struct Input
        {
            float2 uv_MainTex;
        };
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
        }
        ENDCG
    }
}