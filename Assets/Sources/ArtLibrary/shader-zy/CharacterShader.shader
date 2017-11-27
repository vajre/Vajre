// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:1,spmd:0,trmd:0,grmd:1,uamb:False,mssp:True,bkdf:True,hqlp:False,rprd:False,enco:False,rmgx:True,imps:False,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5149762,fgcg:0.5363694,fgcb:0.5514706,fgca:1,fgde:0.01,fgrn:25,fgrf:450,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33813,y:32798,varname:node_3138,prsc:2|diff-5674-OUT,diffpow-5451-OUT,spec-3677-RGB,amdfl-9603-OUT,custl-9603-OUT;n:type:ShaderForge.SFN_Tex2d,id:6544,x:32136,y:32941,ptovrint:False,ptlb:diffuse,ptin:_diffuse,varname:node_6544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:5674,x:33050,y:32770,varname:node_5674,prsc:2|A-2936-OUT,B-6544-RGB;n:type:ShaderForge.SFN_Multiply,id:2936,x:32623,y:32650,varname:node_2936,prsc:2|A-7266-OUT,B-7985-RGB,C-4063-OUT,D-3434-OUT;n:type:ShaderForge.SFN_Color,id:7985,x:32386,y:32459,ptovrint:False,ptlb:f_color,ptin:_f_color,varname:node_7985,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Fresnel,id:7266,x:32028,y:32556,varname:node_7266,prsc:2|NRM-8172-OUT,EXP-1676-OUT;n:type:ShaderForge.SFN_NormalVector,id:8172,x:31742,y:32478,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:1676,x:31686,y:32790,ptovrint:False,ptlb:f_line,ptin:_f_line,varname:node_1676,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_ToggleProperty,id:3434,x:32440,y:32819,ptovrint:False,ptlb:f,ptin:_f,varname:node_3434,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True;n:type:ShaderForge.SFN_Slider,id:4063,x:32058,y:32761,ptovrint:False,ptlb:f_power,ptin:_f_power,varname:node_4063,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:3677,x:33475,y:32909,ptovrint:False,ptlb:spe,ptin:_spe,varname:node_3677,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:9603,x:33311,y:33379,varname:node_9603,prsc:2|A-6103-OUT,B-6662-OUT;n:type:ShaderForge.SFN_Multiply,id:6103,x:32879,y:33330,varname:node_6103,prsc:2|A-2903-RGB,B-8692-OUT;n:type:ShaderForge.SFN_Tex2d,id:2903,x:32597,y:33160,ptovrint:False,ptlb:opacity,ptin:_opacity,varname:node_2903,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Color,id:1836,x:32328,y:33444,ptovrint:False,ptlb:color,ptin:_color,varname:node_1836,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.3014706,c2:0.3014706,c3:0.3014706,c4:1;n:type:ShaderForge.SFN_Dot,id:8618,x:32203,y:33634,varname:node_8618,prsc:2,dt:0|A-2663-OUT,B-9093-OUT;n:type:ShaderForge.SFN_NormalVector,id:2663,x:31855,y:33543,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:9093,x:31855,y:33775,varname:node_9093,prsc:2;n:type:ShaderForge.SFN_Dot,id:4741,x:32193,y:33919,varname:node_4741,prsc:2,dt:1|A-9093-OUT,B-6564-OUT;n:type:ShaderForge.SFN_ViewReflectionVector,id:6564,x:31894,y:33943,varname:node_6564,prsc:2;n:type:ShaderForge.SFN_Power,id:7014,x:32471,y:34014,varname:node_7014,prsc:2|VAL-4741-OUT,EXP-4297-OUT;n:type:ShaderForge.SFN_Exp,id:4297,x:32193,y:34123,varname:node_4297,prsc:2,et:0|IN-6570-OUT;n:type:ShaderForge.SFN_Slider,id:6570,x:31816,y:34138,ptovrint:False,ptlb:highlight,ptin:_highlight,varname:node_6570,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4,max:5;n:type:ShaderForge.SFN_Multiply,id:6662,x:32717,y:34014,varname:node_6662,prsc:2|A-7014-OUT,B-8001-OUT;n:type:ShaderForge.SFN_Slider,id:8001,x:32392,y:34205,ptovrint:False,ptlb:node_8001,ptin:_node_8001,varname:node_8001,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5774312,max:1;n:type:ShaderForge.SFN_Multiply,id:8692,x:32582,y:33356,varname:node_8692,prsc:2|A-6544-RGB,B-1836-RGB;n:type:ShaderForge.SFN_Slider,id:6911,x:32493,y:33011,ptovrint:False,ptlb:node_6911,ptin:_node_6911,varname:node_6911,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:5;n:type:ShaderForge.SFN_Add,id:5451,x:32873,y:32922,varname:node_5451,prsc:2|A-6544-RGB,B-6911-OUT;proporder:6544-7985-1676-4063-3434-3677-2903-1836-6570-8001-6911;pass:END;sub:END;*/

Shader "Shader Forge/CharacterShader" {
    Properties {
        _diffuse ("diffuse", 2D) = "white" {}
        _f_color ("f_color", Color) = (1,1,1,1)
        _f_line ("f_line", Range(0, 5)) = 1
        _f_power ("f_power", Range(0, 1)) = 0
        [MaterialToggle] _f ("f", Float ) = 1
        _spe ("spe", 2D) = "white" {}
        _opacity ("opacity", 2D) = "white" {}
        _color ("color", Color) = (0.3014706,0.3014706,0.3014706,1)
        _highlight ("highlight", Range(0, 5)) = 4
        _node_8001 ("node_8001", Range(0, 1)) = 0.5774312
        _node_6911 ("node_6911", Range(0, 5)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _diffuse; uniform float4 _diffuse_ST;
            uniform float4 _f_color;
            uniform float _f_line;
            uniform fixed _f;
            uniform float _f_power;
            uniform sampler2D _spe; uniform float4 _spe_ST;
            uniform sampler2D _opacity; uniform float4 _opacity_ST;
            uniform float4 _color;
            uniform float _highlight;
            uniform float _node_8001;
            uniform float _node_6911;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 1.0 - 0.5; // Convert roughness to gloss
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float4 _spe_var = tex2D(_spe,TRANSFORM_TEX(i.uv0, _spe));
                float3 specularColor = _spe_var.rgb;
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float4 _diffuse_var = tex2D(_diffuse,TRANSFORM_TEX(i.uv0, _diffuse));
                float3 directDiffuse = pow(max( 0.0, NdotL), (_diffuse_var.rgb+_node_6911)) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                float4 _opacity_var = tex2D(_opacity,TRANSFORM_TEX(i.uv0, _opacity));
                float3 node_9603 = ((_opacity_var.rgb*(_diffuse_var.rgb*_color.rgb))+(pow(max(0,dot(lightDirection,viewReflectDirection)),exp(_highlight))*_node_8001));
                indirectDiffuse += node_9603; // Diffuse Ambient Light
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuseColor = ((pow(1.0-max(0,dot(i.normalDir, viewDirection)),_f_line)*_f_color.rgb*_f_power*_f)+_diffuse_var.rgb);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
