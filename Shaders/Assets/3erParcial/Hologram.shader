Shader "Hologram/Rim"
{
    Properties
    {
        _RimColor("Rim Color", Color) = (0,0.5,0.5,0)
        _RimPower("Rim Power", Range (0.5, 0.8)) = 3
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
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = _RimColor.rgb * pow(rim, _RimColor);
            o.Alpha = pow(rim - _RimColor, _RimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
