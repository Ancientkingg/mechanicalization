#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform float GameTime;
uniform mat4 ModelViewMat;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;
in vec3 normal;
in vec3 position;
in vec2 faceCoords;
in vec4 lightlevel;
in vec4 dyecolor;

out vec4 fragColor;

#moj_import <utils.glsl>

#moj_import <materials.glsl>


void main() {
    vec3 dye = dyecolor.rgb * 255.;
    vec2 atlasSize = textureSize(Sampler0, 0);
    vec4 origTex = texture(Sampler0, texCoord0);
    if (origTex.a < 0.1) discard;
    vec4 tempTex;
    vec4 blockTex = origTex;        

    #moj_import <metal.glsl>
    #moj_import <emissive.glsl>

    vec4 color = mix(blockTex, origTex * vertexColor * ColorModulator, float(origTex == blockTex));
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
