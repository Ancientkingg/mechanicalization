
#define LIGHT0_DIRECTION vec3(0.2, 1.0, -0.7) // Default light 0 direction everywhere except in inventory
#define LIGHT1_DIRECTION vec3(-0.2, 1.0, 0.7) // Default light 1 direction everywhere except in nether and inventory

#define M_2PI 6.283185307
#define M_6PI 18.84955592

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec4 sampleCubeMap(vec3 vector, ivec2 origin, ivec2 cubemapSize)
{
    vec3 dir = vector;
    float maxDir = max(abs(vector.x), max(abs(vector.y), abs(vector.z)));
    vec3 absDir = abs(vector);
    dir = dir / maxDir * 0.975;
    ivec2 newOrigin = origin;
    // what to do when it hit the bottom/top
    ivec2 coords = newOrigin - ivec2(dir.zx * (cubemapSize.y / 6)) * int(sign(dir.y));
    vec4 Color;
    if (maxDir == absDir.x){
        // what to do when it hit one of the x-sides
        newOrigin.y -= int((cubemapSize.y / 3) * sign(dir.x));
        coords = newOrigin + ivec2(dir.z * (cubemapSize.y / 6) * -1, dir.y * (cubemapSize.y / 6) * sign(dir.x));
        Color = texelFetch(Sampler0, coords, 0);
    }else if (maxDir == absDir.y){
        // what to do when it hit the bottom/top
        newOrigin.x += int((cubemapSize.y / 1.5) * max(0,-sign(dir.y)));
        coords = newOrigin - ivec2(dir.zx * (cubemapSize.y / 6)) * int(sign(dir.y));
        Color = texelFetch(Sampler0, coords, 0);
    }else if (maxDir == absDir.z){
        // what to do when it hit the z-sides
        newOrigin.x -= int((cubemapSize.y / 3) * sign(dir.z));
        coords = newOrigin + ivec2(dir.y * (cubemapSize.y / 6) * sign(dir.z), dir.x * (cubemapSize.y / 6) * -1);
        Color = texelFetch(Sampler0, coords, 0);
    }
    // return Color;
    // gaussian blur; credit to https://www.shadertoy.com/view/Xltfzj
    const float Directions = 16.0;
    const float Quality = 16.0;
    const float Size = 4.0;
    const float Radius = Size / 2.0;
    
    for( float d=0.0; d<M_2PI; d+=M_2PI/Directions)
    {
		for(float i=1.0/Quality; i<=1.0; i+=1.0/Quality)
        {
			Color += texelFetch(Sampler0, ivec2(coords+vec2(cos(d),sin(d))*Radius*i), 0);		
        }
    }
    
    // Output to screen
    Color /= Quality * Directions - 15.0;
    return Color;
}

vec4 rgb(float r, float g, float b)
{
    return vec4(r / 255., g / 255., b / 255., 1);
}

bool testFloat(float a, float b)
{
    return abs(a - b) < 0.000001;
}

bool testRGB(vec3 color1, vec3 color2)
{
    return distance(color1, color2) < 0.5;
}

mat3 calculateTBN(vec3 normal){
    const float EPSILON = 0.001;
    float dotX = dot(normal, vec3(1, 0, 0));
    float dotY = dot(normal, vec3(0, 1, 0));
    float dotZ = dot(normal, vec3(0, 0, 1));
    vec3 tangent;
    if (abs(dotX) > 1 - EPSILON) {
      tangent = vec3(0, 0, 1) * sign(dotX);
    } else if (abs(dotY) > 1 - EPSILON) {
      tangent = vec3(1, 0, 0) * sign(dotY);
    } else {
      tangent = vec3(1, 0, 0) * sign(dotZ);
    }
    vec3 bitangent = cross(tangent, normal);
    // construct tbn
    vec3 T = normalize(tangent);
    vec3 B = normalize(bitangent);
    vec3 N = normalize(normal);
    return mat3(T, B, N);
}

bool isNether(vec3 light0, vec3 light1) {
    return light0 == -light1;
}

/*
 * Returns camera to world space matrix given light directions
 * Creates matrix by comparing world space light directions to camera space light directions
 * Credit to Onnowhere for this function
 */
mat3 getWorldMat(vec3 light0, vec3 light1) {
    if (isNether(light0, light1)) {
        // Cannot determine matrix in the nether due to parallel light directions
        return mat3(0.0);
    }
    mat3 V = mat3(normalize(LIGHT0_DIRECTION), normalize(LIGHT1_DIRECTION), normalize(cross(LIGHT0_DIRECTION, LIGHT1_DIRECTION)));
    mat3 W = mat3(normalize(light0), normalize(light1), normalize(cross(light0, light1)));
    return W * inverse(V);
}
