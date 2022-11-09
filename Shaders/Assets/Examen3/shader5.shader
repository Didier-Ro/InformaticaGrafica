Shader "Examen3/shader5"
{
    Properties
    {
        _RimPower("Rim Power", Range (0, 1)) = 1
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" }
        Pass
        {
            ZWrite On
            ColorMask GR
        }
        CGPROGRAM
        #pragma surface surf Lambert alpha:fade
        
        float4 _RimColor;
        float _RimPower;

        struct Input
        {
            float3 viewDir;
        };
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rg = 1; 
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Alpha = pow(rim - _RimPower, _RimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
