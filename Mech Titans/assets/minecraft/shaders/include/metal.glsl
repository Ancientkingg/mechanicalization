
tempTex = MAT_reflection(0.1, blockTex, normal);
tempTex = MAT_specular(2, tempTex, normal);
blockTex = mix(blockTex, tempTex, testFloat(origTex.a, 254. / 255.));