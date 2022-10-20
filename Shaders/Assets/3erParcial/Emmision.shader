Shader "Parcial3/Emmision"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MetallicTex ("Metallix (R)", 2D) = "white" {}
        _Emission ("Emission", Range(0,10)) = 5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard
        
        sampler2D _MetallicTex;

        struct Input
        {
            float2 uv_MetallicTex;
        };
        
        half _Metallic;
        half _Emission;
        float4 _Color;
        

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo= _Color.rgb; 
            o.Emission = tex2D(_MetallicTex, IN.uv_MetallicTex) * _Emission;
            o.Metallic = _Metallic;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
