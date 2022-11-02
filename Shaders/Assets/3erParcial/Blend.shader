Shader "Parcial3/Blend"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "black" {}
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        //o.Alpha = c.a
        //Blend SrcAlpha OneMinusSrcAlpha
        Blend One OneMinusSrcAlpha
        Pass{SetTexture[_MainTex]{combine texture}}
    }
}
