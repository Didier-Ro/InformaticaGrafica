Shader "Parcial3/Blend2"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "black" {}
    }
    SubShader
    {
        Tags { "Queue" = "AlphaTest" }
        //o.Alpha = c.a
        //Blend SrcAlpha OneMinusSrcAlpha
        Blend One OneMinusSrcAlpha
        Pass
        {
            ZWrite Off
            ColorMask GGA
            SetTexture[_MainTex]{combine texture}
        }
    }
}