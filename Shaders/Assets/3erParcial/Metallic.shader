Shader "Metallic/p2"
{
    Properties
    {
       _MetallicTex ("Texture", 2D) = "white"{}
       _Color("Color", Color) = (1,1,1,1)
       _Metallic("Metallic", Range(0,1)) = 1  
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D _MetallicTex;
        fixed4 _Color;
        half _Metallic;

        struct Input
        {
            float2 uv_MetallicTex;
        };
        

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
           o.Albedo = _Color.rgb;
           o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).rgb;
           o.Metallic = _Metallic; 
        }
        ENDCG
    }
    FallBack "Diffuse"
}
