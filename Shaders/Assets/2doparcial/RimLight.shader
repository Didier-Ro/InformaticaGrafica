Shader "RimLight/Rim"
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
        };
        

        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = dot(IN.viewDir, o.Normal);
            o.Albedo = float3(dotp,dotp,1);
            //o.Albedo = float3(dot(IN.viewDir, o.Normal),1,1);
        }
        ENDCG
    }
}
