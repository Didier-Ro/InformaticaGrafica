Shader "ShaderBien/Bien"
{
	Properties
	{
		_Color("Color", Color) = (1,1,1,1)
		_MainTex("Tex", 2D) = "white" {}
		_CUBE("Cube", CUBE) = ""{}
		_Range("Range", Range(0,2)) = 2

	}
	SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert
		float4 _Color;
		sampler2D _MainTex;
		half _Range;
		samplerCUBE _Cube;

		struct Input
		{
			float2 uv_MainTex;
			float3 worldRefl;
		};
		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo.g = tex2D(_MainTex, IN.uv_MainTex).g;
			o.Emission = texCUBE(_Cube, IN.worldRefl);
		}
		ENDCG
	}
}