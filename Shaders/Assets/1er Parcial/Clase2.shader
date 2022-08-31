Shader "Clase/1er"
{
    Properties
    {
        _Color("Color", Color) = (1, 1, 1, 1)
        _Emission("Emission", Color) = (1, 1, 1, 1)
    }
    
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        float4 _Color;
        float4 _Emission;
        struct Input
        {
            float2 uvMainTEx;
        };
        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo.b = _Color.b;
            o.Emission.r = _Emission.r * _Emission.r; 
        }
        ENDCG
    }
}