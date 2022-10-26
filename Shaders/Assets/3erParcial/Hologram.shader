Shader "Hologram/Rim"
{
    Properties
    {
        _RimColor("Rim Color", Color) = (0,0.5,0.5,0)
        _RimPower("Rim Power", Range (0, 3)) = 3
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" }
        Pass
        {
            ZWrite On
            ColorMask 0
        }
        CGPROGRAM
        #pragma surface surf Lambert alpha:fade
        
        float4 _RimColor;
        half _RimPower;

        struct Input
        {
            float3 viewDir;
        };
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = pow(rim, _RimColor);
            o.Alpha = pow(rim, _RimColor);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
