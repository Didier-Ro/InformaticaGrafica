Shader "Diffuse/DiffuseColor"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex("Textura", 2D) = "white"{}
    }
    SubShader
    {
       CGPROGRAM
       #pragma surface surf Lambert

       float4 _Color;
       sampler2D _MainTex;
       
       struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
        }
        ENDCG
    }
}
