#version 150


#moj_import <light.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord1;
out vec2 texCoord2;
out vec3 normal;
out vec3 position;
out vec2 faceCoords;
out vec4 lightlevel;
out vec4 dyecolor;

vec2 generateFaceCoords(){
    if (gl_VertexID % 4 == 0) return vec2(0.0,0.0);
    else if (gl_VertexID % 4 == 1) return vec2(0.0,1.0);
    else if (gl_VertexID % 4 == 2) return vec2(1.0,1.0);
    else if (gl_VertexID % 4 == 3) return vec2(1.0,0.0);
}


void main() {
    position = Position;
    normal = Normal;
    faceCoords = generateFaceCoords();
    lightlevel = texture(Sampler2, vec2(0,1));

    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    dyecolor = Color;
    vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    texCoord1 = UV1;
    texCoord2 = UV2;
}
