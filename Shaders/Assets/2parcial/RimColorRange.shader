Shader "RimColorRange/ColorRange"
{
    Properties
    {
        _Color("RimColor", Color) = (1,1,1,1)
        _Range("RimRange", Range(0,5)) = 5 
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        float3 _Color;
        half _Range;
        
        struct Input
        {
            float3 viewDir;
            float3 worldRefl;
        }
        ;
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = 1-saturate(dot(IN.worldRefl, o.Normal)); //Cambiamos viewDir po worldRefl para que el objeto sea reflejante
                              //R   G     b
            o.Emission = (_Color * dotp) * _Range * _Range; // Multiplicamos por el rango para poder manipular la intensidad
            o.Albedo.rgb = 0;
        }
        ENDCG
    }
}
