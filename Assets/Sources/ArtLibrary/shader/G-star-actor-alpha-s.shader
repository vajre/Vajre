// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4612889,fgcg:0.752801,fgcb:0.7941176,fgca:1,fgde:0.01,fgrn:5,fgrf:30,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:1003,x:32902,y:32646,varname:node_1003,prsc:2|custl-891-OUT,alpha-1555-OUT,olwid-1744-OUT,olcol-4441-RGB;n:type:ShaderForge.SFN_NormalVector,id:2432,x:31762,y:32569,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:9866,x:31762,y:32725,varname:node_9866,prsc:2;n:type:ShaderForge.SFN_Dot,id:19,x:31922,y:32642,varname:node_19,prsc:2,dt:0|A-2432-OUT,B-9866-OUT;n:type:ShaderForge.SFN_Clamp01,id:8190,x:32114,y:32601,varname:node_8190,prsc:2|IN-19-OUT;n:type:ShaderForge.SFN_RemapRange,id:2300,x:32304,y:32601,varname:node_2300,prsc:2,frmn:0.3,frmx:1,tomn:0.8,tomx:1|IN-8190-OUT;n:type:ShaderForge.SFN_Tex2d,id:3174,x:32362,y:32255,ptovrint:False,ptlb:diffuse(RGB)A(Opacity),ptin:_diffuse,varname:node_3174,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:7482,x:32320,y:32446,ptovrint:False,ptlb:color,ptin:_color,varname:node_7482,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.7058823,c2:0.7058823,c3:0.7058823,c4:1;n:type:ShaderForge.SFN_Multiply,id:9816,x:32645,y:32371,varname:node_9816,prsc:2|A-3174-RGB,B-7482-RGB,C-2300-OUT,D-4631-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:9337,x:31716,y:32980,varname:node_9337,prsc:2;n:type:ShaderForge.SFN_Dot,id:8498,x:31909,y:32980,varname:node_8498,prsc:2,dt:1|A-9866-OUT,B-9337-OUT;n:type:ShaderForge.SFN_Power,id:5008,x:32034,y:33123,varname:node_5008,prsc:2|VAL-8498-OUT,EXP-8850-OUT;n:type:ShaderForge.SFN_Exp,id:8850,x:31820,y:33245,varname:node_8850,prsc:2,et:0|IN-9616-OUT;n:type:ShaderForge.SFN_Slider,id:9616,x:31482,y:33309,ptovrint:False,ptlb:light,ptin:_light,varname:node_9616,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-5,cur:5,max:5;n:type:ShaderForge.SFN_Multiply,id:311,x:32293,y:33188,varname:node_311,prsc:2|A-5008-OUT,B-2427-OUT;n:type:ShaderForge.SFN_Slider,id:2427,x:31955,y:33421,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_2427,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-5,cur:0,max:5;n:type:ShaderForge.SFN_Add,id:891,x:32582,y:32585,varname:node_891,prsc:2|A-9816-OUT,B-311-OUT,C-8843-OUT;n:type:ShaderForge.SFN_Slider,id:4631,x:32551,y:32215,ptovrint:False,ptlb:ambient,ptin:_ambient,varname:node_4631,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_Fresnel,id:9167,x:32236,y:32821,varname:node_9167,prsc:2|NRM-2432-OUT,EXP-1864-OUT;n:type:ShaderForge.SFN_Multiply,id:8843,x:32506,y:32857,varname:node_8843,prsc:2|A-9167-OUT,B-8950-RGB,C-9745-OUT,D-9155-OUT;n:type:ShaderForge.SFN_Color,id:8950,x:32236,y:32988,ptovrint:False,ptlb:Fresnel Color,ptin:_FresnelColor,varname:node_8950,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_ToggleProperty,id:9155,x:32514,y:33211,ptovrint:False,ptlb:Fresnel Open,ptin:_FresnelOpen,varname:node_9155,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True;n:type:ShaderForge.SFN_Slider,id:1864,x:31884,y:32855,ptovrint:False,ptlb:Fresnel Size,ptin:_FresnelSize,varname:node_1864,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Slider,id:9745,x:32435,y:33094,ptovrint:False,ptlb:Fresnel Power,ptin:_FresnelPower,varname:node_9745,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:3;n:type:ShaderForge.SFN_Slider,id:1744,x:32636,y:33244,ptovrint:False,ptlb:OutLine Power,ptin:_OutLinePower,varname:node_1744,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.1;n:type:ShaderForge.SFN_Color,id:4441,x:32734,y:33357,ptovrint:False,ptlb:OutLine Color,ptin:_OutLineColor,varname:node_4441,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1555,x:33207,y:32549,varname:node_1555,prsc:2|A-3174-A,B-586-OUT;n:type:ShaderForge.SFN_Slider,id:586,x:32991,y:32413,ptovrint:False,ptlb:Opacity Power,ptin:_OpacityPower,varname:node_586,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:3;proporder:3174-586-7482-9616-2427-4631-9155-8950-1864-9745-4441-1744;pass:END;sub:END;*/

Shader "G-Star-Actor-Alpha-s" {
    Properties {
        _diffuse ("diffuse(RGB)A(Opacity)", 2D) = "white" {}
        _OpacityPower ("Opacity Power", Range(0, 1)) = 1
        _color ("color", Color) = (0.7058823,0.7058823,0.7058823,1)
        _light ("light", Range(-5, 5)) = 5
        _specular ("specular", Range(-5, 5)) = 0
        _ambient ("ambient", Range(0, 5)) = 0
        [MaterialToggle] _FresnelOpen ("Fresnel Open", Float ) = 0
        _FresnelColor ("Fresnel Color", Color) = (0.5,0.5,0.5,1)
        _FresnelSize ("Fresnel Size", Range(0, 5)) = 1
        _FresnelPower ("Fresnel Power", Range(0, 3)) = 1
        _OutLineColor ("OutLine Color", Color) = (0,0,0,1)
        _OutLinePower ("OutLine Power", Range(0, 0.1)) = 0
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        //Pass {
        //    Name "Outline"
        //    Tags {
        //    }
        //    Cull Front
        //    
        //    CGPROGRAM
        //    #pragma vertex vert
        //    #pragma fragment frag
        //    #include "UnityCG.cginc"
        //    #pragma fragmentoption ARB_precision_hint_fastest
        //    #pragma multi_compile_shadowcaster
        //    #pragma multi_compile_fog
        //    #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
        //    #pragma target 3.0
        //    uniform float _OutLinePower;
        //    uniform float4 _OutLineColor;
        //    struct VertexInput {
        //        float4 vertex : POSITION;
        //        float3 normal : NORMAL;
        //    };
        //    struct VertexOutput {
        //        float4 pos : SV_POSITION;
        //        UNITY_FOG_COORDS(0)
        //    };
        //    VertexOutput vert (VertexInput v) {
        //        VertexOutput o = (VertexOutput)0;
        //        o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*_OutLinePower,1) );
        //        UNITY_TRANSFER_FOG(o,o.pos);
        //        return o;
        //    }
        //    float4 frag(VertexOutput i) : COLOR {
        //        return fixed4(_OutLineColor.rgb,0);
        //    }
        //    ENDCG
        //}
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            //ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float4 _color;
            uniform float _light;
            uniform float _specular;
            uniform float _ambient;
            uniform float4 _FresnelColor;
            uniform fixed _FresnelOpen;
            uniform float _FresnelSize;
            uniform float _FresnelPower;
            uniform float _OpacityPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(i.uv0, _diffuse));
                float3 finalColor = ((_diffuse_var.rgb*_color.rgb*(saturate(dot(i.normalDir,lightDirection))*0.2857143+0.7142857)*_ambient)+(pow(max(0,dot(lightDirection,viewReflectDirection)),exp(_light))*_specular)+(pow(1.0-max(0,dot(i.normalDir, viewDirection)),_FresnelSize)*_FresnelColor.rgb*_FresnelPower*_FresnelOpen));
                fixed4 finalRGBA = fixed4(finalColor,(_diffuse_var.a*_OpacityPower));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
