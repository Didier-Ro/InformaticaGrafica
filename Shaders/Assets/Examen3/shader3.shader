Shader "Examen3/shader3"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MetallicTex ("Metallic (R)", 2D) = "white" {}
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _SpecularColor ("Specular", Color) = (1,1,1,1)
    }
    SubShader
    {

        CGPROGRAM
        #pragma surface surf StandardSpecular

        sampler2D _MainTex;

        float4 _Color;
        float4 _SpecularColor;
        half _Metallic;
        sampler2D _MetallicTex;

        struct Input
        {
            float2 uv_MetallicTex;
        };

        void surf (Input IN, inout SurfaceOutputStandardSpecular o)
        {
           o.Albedo = _Color.rgb;
           o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex);
           o.Specular = _Metallic * _SpecularColor; 
        }
        ENDCG
    }
    FallBack "Diffuse"
}
