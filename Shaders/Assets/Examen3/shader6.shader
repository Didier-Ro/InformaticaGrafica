Shader "Examen3/shader6"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Decal ("Decal (RGBA)", 2D) = "white" {}
        _NormalMap ("Normal", 2D) = "bump" {}
        _OtherTex ("Other Tex", 2D) = "white" {}


    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM

        #pragma surface surf Standard

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _NormalMap;
        sampler2D _Decal;
        sampler2D _OtherTex;



        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
            float2 uv_Decal;
            float2 uv_OtherTex;
        };




        void surf (Input IN, inout SurfaceOutputStandard o)
        {
          o.Normal = UnpackNormal (tex2D (_NormalMap, IN.uv_NormalMap));
          fixed4 a = tex2D (_MainTex, IN.uv_MainTex);
          fixed4 b = tex2D (_Decal, IN.uv_MainTex);
          o.Albedo = (a + b) * a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}