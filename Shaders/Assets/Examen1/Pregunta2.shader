Shader "Pregunta2/Respuesta2"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _Cube("Cube", CUBE) = "" {}
        _Color("Color", Color) = (1,1,1,1)
    }
        SubShader
        {
            CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _MainTex;
            samplerCUBE _Cube;
            float4 _Color;

            struct Input
            {
                float2 uv_MainTex;
                float3 worldRefl;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo = tex2D(_MainTex, IN.uv_MainTex) * _Color;
                o.Emission = texCUBE(_Cube, IN.worldRefl);
            }
            ENDCG
        }
}
