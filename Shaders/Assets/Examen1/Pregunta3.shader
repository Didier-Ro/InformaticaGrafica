Shader "Pregunta3/Respuesta3"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Texture", 2D) = "white" {}
        _Emission("Emission", Color) = (1,1,1,1)
    }
        SubShader
        {
            CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _MainTex;
            float4 _Emission;
            float4 _Color;
            struct Input
            {
                float2 uv_MainTex;
            };

            void surf(Input IN, inout SurfaceOutput o)
            {
                o.Albedo.b = tex2D(_MainTex, IN.uv_MainTex).b * _Color.b;
                o.Emission.b = _Emission.b;
            }
            ENDCG
        }
}