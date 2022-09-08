Shader "Pregunta1/Respuesta1"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Cube("Cube", CUBE) = "" {}
        _Range ("Range", Range(0, 10)) = 10
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        samplerCUBE _Cube;
        half _Range;

        struct Input
        {
            float2 uv_MainTex;
            float3 worldRefl;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Emission = texCUBE(_Cube, IN.worldRefl) * (_Range/6);
        }
        ENDCG
    }
}