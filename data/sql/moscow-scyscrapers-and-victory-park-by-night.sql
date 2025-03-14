BEGIN;
INSERT INTO routes (
                name, url, length, duration, 
                category, created_at
            ) VALUES (
                'Moscow scyscrap', 'moscow-scyscrap', 5644, 5792,
                'walking', 1741996736
            );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.532599, 55.749124), 4326), 
                    1470091810, 131, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533596, 55.748432), 4326), 
                    1470091824, 237, 10.3164
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533599, 55.748623), 4326), 
                    1470091826, 225, 12.1973
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533766, 55.748232), 4326), 
                    1470091841, 203, 3.3223
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533685, 55.748004), 4326), 
                    1470091878, 180, 0.9335
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533255, 55.748162), 4326), 
                    1470091943, 139, 0.8027
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533409, 55.748214), 4326), 
                    1470091964, 142, 0.5552
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533306, 55.748289), 4326), 
                    1470091976, 145, 0.9133
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533911, 55.74848), 4326), 
                    1470092032, 146, 0.7754
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534721, 55.748434), 4326), 
                    1470092075, 133, 1.2223
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535254, 55.748689), 4326), 
                    1470092106, 143, 1.4486
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535423, 55.748663), 4326), 
                    1470092118, 170, 2.4207
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535509, 55.748367), 4326), 
                    1470092186, 172, 0.4913
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535956, 55.747938), 4326), 
                    1470092218, 211, 2.1165
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535822, 55.747733), 4326), 
                    1470092231, 213, 1.8741
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.53598, 55.747689), 4326), 
                    1470092251, 214, 0.5539
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535591, 55.747491), 4326), 
                    1470092270, 143, 4.1169
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535594, 55.747167), 4326), 
                    1470092293, 137, 1.5873
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535323, 55.747048), 4326), 
                    1470092308, 143, 1.4871
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534977, 55.746565), 4326), 
                    1470092358, 137, 1.1642
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.535263, 55.746198), 4326), 
                    1470092425, 124, 0.6932
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534461, 55.746185), 4326), 
                    1470092482, 124, 0.881
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533736, 55.745661), 4326), 
                    1470092555, 132, 1.0176
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534329, 55.745318), 4326), 
                    1470092637, 124, 0.6561
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534044, 55.745643), 4326), 
                    1470092695, 124, 0.6948
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533563, 55.745745), 4326), 
                    1470092724, 123, 1.11
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533716, 55.746037), 4326), 
                    1470092746, 132, 1.5922
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534348, 55.746455), 4326), 
                    1470092788, 137, 1.458
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534329, 55.74703), 4326), 
                    1470092844, 172, 1.3026
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533793, 55.747263), 4326), 
                    1470092866, 165, 1.9527
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533691, 55.747548), 4326), 
                    1470092888, 144, 1.7522
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533823, 55.747819), 4326), 
                    1470092916, 171, 1.4748
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533319, 55.748209), 4326), 
                    1470092949, 176, 1.6317
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533016, 55.74874), 4326), 
                    1470092996, 189, 1.3486
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533117, 55.748826), 4326), 
                    1470093006, 193, 1.2108
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.532652, 55.749112), 4326), 
                    1470093036, 171, 1.6132
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.532871, 55.749349), 4326), 
                    1470093066, 163, 1.0246
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533389, 55.749121), 4326), 
                    1470093123, 216, 1.1758
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533264, 55.74878), 4326), 
                    1470093130, 197, 6.161
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.532877, 55.748539), 4326), 
                    1470093144, 180, 2.8515
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.53323, 55.746828), 4326), 
                    1470093258, 141, 1.7146
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533434, 55.746563), 4326), 
                    1470093281, 151, 1.4624
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533448, 55.745609), 4326), 
                    1470093349, 144, 1.5634
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534175, 55.743408), 4326), 
                    1470093616, 144, 0.9323
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534416, 55.743424), 4326), 
                    1470093659, 140, 0.3653
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534623, 55.743686), 4326), 
                    1470093740, 128, 0.4202
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.53382, 55.743719), 4326), 
                    1470093917, 117, 0.2914
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533628, 55.743885), 4326), 
                    1470093932, 105, 1.6722
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533436, 55.743614), 4326), 
                    1470093945, 130, 3.1458
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533469, 55.742261), 4326), 
                    1470094062, 149, 1.2962
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533937, 55.742187), 4326), 
                    1470094106, 144, 0.7008
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533842, 55.742003), 4326), 
                    1470094150, 146, 0.4864
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534085, 55.741426), 4326), 
                    1470094191, 154, 1.62
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.534042, 55.741048), 4326), 
                    1470094213, 147, 1.9407
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.533504, 55.740207), 4326), 
                    1470094276, 152, 1.5797
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.53059, 55.739444), 4326), 
                    1470094414, 150, 1.4578
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.529586, 55.739376), 4326), 
                    1470094460, 153, 1.3777
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.52931, 55.73948), 4326), 
                    1470094474, 147, 1.5456
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.527838, 55.738979), 4326), 
                    1470094541, 146, 1.6072
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.527567, 55.738651), 4326), 
                    1470094574, 153, 1.2372
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.526985, 55.738466), 4326), 
                    1470094602, 157, 1.5011
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.526816, 55.73821), 4326), 
                    1470094622, 164, 1.5582
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.525966, 55.73827), 4326), 
                    1470094645, 155, 2.3649
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.525419, 55.738076), 4326), 
                    1470094671, 156, 1.557
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.521926, 55.737628), 4326), 
                    1470094818, 153, 1.5257
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.520784, 55.7374), 4326), 
                    1470094870, 152, 1.4589
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.519346, 55.736874), 4326), 
                    1470094992, 168, 0.8898
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.51732, 55.736612), 4326), 
                    1470095084, 162, 1.416
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517167, 55.736551), 4326), 
                    1470095118, 163, 0.3464
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517517, 55.736315), 4326), 
                    1470095151, 160, 1.0402
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517141, 55.73633), 4326), 
                    1470095219, 154, 0.3577
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517696, 55.736007), 4326), 
                    1470095282, 154, 0.7932
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517592, 55.735806), 4326), 
                    1470095283, 154, 23.2792
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517284, 55.735849), 4326), 
                    1470095295, 161, 1.758
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.516829, 55.735686), 4326), 
                    1470095338, 157, 0.7909
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.516588, 55.735134), 4326), 
                    1470095416, 157, 0.8103
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.515025, 55.734608), 4326), 
                    1470095595, 157, 0.6369
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.514583, 55.734913), 4326), 
                    1470095717, 161, 0.3602
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.508477, 55.732257), 4326), 
                    1470096457, 166, 0.6528
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.509308, 55.732268), 4326), 
                    1470096621, 163, 0.3178
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.509655, 55.732066), 4326), 
                    1470096652, 163, 1.008
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.509776, 55.731793), 4326), 
                    1470096699, 172, 0.6921
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.509443, 55.732526), 4326), 
                    1470096845, 167, 0.5772
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.510249, 55.732887), 4326), 
                    1470096946, 165, 0.6387
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.51045, 55.733146), 4326), 
                    1470096984, 164, 0.8275
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.516835, 55.735749), 4326), 
                    1470097470, 161, 1.0155
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517596, 55.735878), 4326), 
                    1470097553, 166, 0.6036
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.517546, 55.73619), 4326), 
                    1470097559, 166, 5.8065
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    9, ST_SetSRID(ST_MakePoint(37.518094, 55.736557), 4326), 
                    1470097602, 166, 1.2398
                );
COMMIT;
