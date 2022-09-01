Shader "DiffuseVerde/DiffuseVerdeM"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex("Textura", 2D) = "white"{}
        _Emission("Emission", Color) = (1, 1, 1, 1)
    }
    SubShader
    {
       CGPROGRAM
       #pragma surface surf Lambert

       float4 _Color;
       float4 _Emission;
       sampler2D _MainTex;
       
       struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo.g = tex2D(_MainTex, IN.uv_MainTex).g;
        }
        ENDCG
    }
}