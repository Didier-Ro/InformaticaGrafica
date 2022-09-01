Shader "Clase3/Diffuse"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Emission("Emission", Color) = (1, 1, 1, 1)
        _Normal("Normal", Color) = (1, 1, 1, 1)
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        float4 _Color;
        float4 _Emission;
        float4 _Normal;
        struct Input
        {
            float2 uv_MainTex;
        };
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color;
            o.Emission = _Emission * _Emission;
            o.Normal = _Normal;
        }
        ENDCG
    }
}