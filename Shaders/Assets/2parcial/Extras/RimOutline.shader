Shader "RimOutline/Outline"
{
    Properties
    {
        _RimPower("RimPower", Range(0,5)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        float4 _RimColor;
        half _RimPower;

        struct Input
        {
            float3 viewDir;
            float3 worldPos;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(IN.viewDir, o.Normal));
            //o.Emission = fract(rim * _RimPower);
                          //condition // verdadero // falso
            o.Emission = rim > 0.7? float3(1,1,0): //Las condiciones permiten manipular el grosos y el color del rim
                         rim > 0.6? float3(1,0,1):
                         rim > 0.5? float3(0,1,0):
                         rim > 0.4? float3(0,1,1):
                         rim > 0.2? float3(1,0,0):0;
        }
        ENDCG
    }
}
