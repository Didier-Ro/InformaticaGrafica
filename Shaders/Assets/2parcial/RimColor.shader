Shader "RimColor/ColorPicker"
{
    Properties
    {
        _Color("RimColor", Color) = (1,1,1,1) 
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        float3 _Color;
        struct Input
        {
            float3 viewDir;
        }
        ;
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = 1-saturate(dot(IN.viewDir, o.Normal));
                              //R   G     b
            o.Emission = _Color * dotp;
            o.Albedo.rgb = 0;
        }
        ENDCG
    }
}
