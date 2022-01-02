
const ivec2 cubemapSize = ivec2(816,306);

vec4 MAT_reflection(float strength, vec4 blockTex, vec3 normal){
    ivec2 origin = ivec2(0) + (cubemapSize.y / 2);
    ivec2 origin_2 = origin;
    origin_2.x += (cubemapSize.y * 4 / 3);
    vec3 vector = reflect(position, normal);
    vec4 reflection = sampleCubeMap(vector, origin, cubemapSize);
    vec4 reflection_night = sampleCubeMap(vector, origin_2, cubemapSize) * 1.5;
    reflection = mix(reflection, reflection_night, smoothstep(0.9, 0.5, lightlevel.r));
    float factor = pow(1 - dot(abs(normal), abs(normalize(position))),1);
    return mix(blockTex * reflection, reflection, clamp(strength,0,1));
}

vec4 MAT_specular(float strength, vec4 blockTex, vec3 normal){
    // float specularStrength = texelFetch(Sampler0, topleft + ivec2(faceCoords * 16) + ivec2(16, 0), 0).r * 2;
    vec3 lightDir = normalize(vec3(0.5,0.5,0.5));
    // mat3 TBN = calculateTBN(normal);
    // lightDir = lightDir * TBN;
    lightDir.y = abs(lightDir.y);
    // make specular pixely use 
    vec3 viewDir = normalize(floor(position * 24));
    vec3 reflectDir = reflect(lightDir, normal);
    float spec = pow(max(dot(viewDir, reflectDir), 0.0), 8);
    // warm sun color rgb(239, 214, 80);
    vec4 specular = strength * spec * mix(texture(Sampler0, texCoord0), mix(rgb(239, 214, 80), rgb(79, 105, 136), smoothstep(0.8, 0.6, lightlevel.r)) ,0.6);
    // compositing specular, fake ambient light
    blockTex.rgb *= (mix(vec3(0.8), vertexColor.rgb, 0.3) + specular.rgb);
    return blockTex;
}

vec4 MAT_iridescence(float strength, vec4 blockTex, vec3 normal){
    vec3 rayDir = normalize((ModelViewMat * vec4(abs(normalize(position)), 1.0)).xyz) / 2;
    blockTex.rgb = mix(hsv2rgb(rgb2hsv(blockTex.rgb) + vec3(dot(rayDir, normal),0.2,0)), blockTex.rgb, clamp(abs(dot(normalize(position), normal))-strength,0.2,1));
    return blockTex;
}

