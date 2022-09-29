Shader "RimLightGreen/Green"
{
    Properties
    {
        
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        

        struct Input
        {
            float3 viewDir;
        }
        ;
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = 1-saturate(dot(IN.viewDir, o.Normal));
                              //R   G     b
            o.Emission = float3(0, pow(dotp,1), pow(dotp,1));
            o.Albedo.rg = 1;
        }
        ENDCG
    }
}
    