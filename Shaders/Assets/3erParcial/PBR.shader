Shader "Parcial3/PBR"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _AOTex("AO", 2D) = "white" {}
        _MetallicTex("Metallic (R)", 2D) = "white" {}
        _Smootness ("Smootness", 2D) = "white"{}
        
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Occlusion("OclussionStrength", Range(0,1)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard
        #pragma target 3.0
        
        sampler2D _MainTex;
        sampler2D _MetallicTex;
        sampler2D _NormalMap;
        sampler2D _AmbientOcclusion;
        sampler2D _Smootness;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_NormalMap;
        };
       
        half _Metallic;
        half _Occlusion;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Metallic = tex2D(_MetallicTex, IN.uv_MainTex) * _Metallic;
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
            o.Occlusion = tex2D(_AmbientOcclusion, IN.uv_MainTex) * _Occlusion;
            o.Smoothness = tex2D(_Smootness, IN.uv_MainTex);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
