Shader "Metallic/p2"
{
   Properties{
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _Specular("Specular", Color) = (1,1,1,1)
        _Metallic("Metallic", Range(0, 1)) = 1
    }
        SubShader{
            Tags { "RenderType" = "Opaque" }
            CGPROGRAM
            #pragma surface surf Standard 
            sampler2D _MainTex;
            struct Input {
                float2 uv_MainTex;
            };
            fixed4 _Specular;
            half _Metallic;
            void surf(Input IN, inout SurfaceOutputStandard o) {
                o.Albedo = _Specular.rgb;
                o.Smoothness = tex2D(_MainTex, IN.uv_MainTex).rgb;
                o.Metallic = _Metallic;
            }
            ENDCG
        }
            FallBack "Diffuse"
}
