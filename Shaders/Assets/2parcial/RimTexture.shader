Shader "RimTexture/Texture"
{
    Properties
    {
        _Color("RimColor", Color) = (1,1,1,1)
        _Range("RimRange", Range(0,1)) = 1
        _MainTex("Albedo", 2D) = "white"{} 
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        float3 _Color;
        half _Range;
        sampler2D _MainTex;
        
        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
        }
        ;
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = 1-saturate(dot(IN.viewDir, o.Normal));
                              //R   G     b
            o.Emission = (_Color * dotp) * _Range;
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex * _Range);
        }
        ENDCG
    }
}