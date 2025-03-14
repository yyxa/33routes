BEGIN;
INSERT INTO routes (
                name, url, length, duration, 
                category, created_at
            ) VALUES (
                'Moscow, Vorobyovy Gory (Sparrow Hills) - Воробьевы горы', 'moscow,-vorobyovy-gory-(sparrow-hills)---воробьевы-горы', 5795, 7195,
                'walking', 1741996736
            );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559558, 55.710559), 4326), 
                    1470142316, 138, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559575, 55.710667), 4326), 
                    1470142842, 143, 0.0245
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559634, 55.710815), 4326), 
                    1470142883, 143, 0.4114
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559673, 55.710769), 4326), 
                    1470142897, 143, 0.4049
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559578, 55.710674), 4326), 
                    1470142904, 143, 1.7321
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559503, 55.710495), 4326), 
                    1470142910, 143, 3.4085
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559671, 55.71064), 4326), 
                    1470142912, 135, 10.425
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559766, 55.710783), 4326), 
                    1470142916, 146, 5.0575
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559833, 55.710794), 4326), 
                    1470142918, 144, 2.4038
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559865, 55.710814), 4326), 
                    1470142924, 142, 0.6001
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559912, 55.710805), 4326), 
                    1470142925, 142, 3.1097
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559893, 55.71088), 4326), 
                    1470142926, 141, 8.4833
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559976, 55.710801), 4326), 
                    1470142927, 132, 13.6088
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559742, 55.710645), 4326), 
                    1470142928, 135, 22.908
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559687, 55.710731), 4326), 
                    1470142929, 131, 10.9233
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559548, 55.710801), 4326), 
                    1470142930, 115, 19.8092
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559738, 55.710844), 4326), 
                    1470142935, 116, 2.5731
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559933, 55.71086), 4326), 
                    1470142938, 118, 4.1685
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560074, 55.710761), 4326), 
                    1470142940, 133, 10.2981
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560124, 55.710791), 4326), 
                    1470142942, 146, 6.8909
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560079, 55.710772), 4326), 
                    1470142944, 149, 2.3136
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559875, 55.71063), 4326), 
                    1470142945, 150, 20.3378
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559702, 55.710511), 4326), 
                    1470142946, 133, 24.1152
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559221, 55.710253), 4326), 
                    1470142977, 127, 1.3551
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559262, 55.710393), 4326), 
                    1470142984, 127, 2.2556
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559311, 55.710453), 4326), 
                    1470142990, 127, 1.2241
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559235, 55.71046), 4326), 
                    1470143009, 128, 0.254
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559216, 55.710495), 4326), 
                    1470143033, 108, 0.8504
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559443, 55.710572), 4326), 
                    1470143041, 101, 2.2518
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559466, 55.710478), 4326), 
                    1470143067, 99, 0.413
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559321, 55.710419), 4326), 
                    1470143109, 95, 0.2833
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559168, 55.710386), 4326), 
                    1470143142, 106, 0.4559
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55907, 55.710306), 4326), 
                    1470143167, 113, 0.5151
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559025, 55.71021), 4326), 
                    1470143172, 109, 2.3486
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558986, 55.71012), 4326), 
                    1470143178, 106, 1.7882
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558906, 55.710029), 4326), 
                    1470143183, 106, 2.2584
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558782, 55.709967), 4326), 
                    1470143198, 103, 0.7207
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558618, 55.709981), 4326), 
                    1470143229, 95, 0.423
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558752, 55.709916), 4326), 
                    1470143256, 97, 0.4169
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558939, 55.709964), 4326), 
                    1470143277, 96, 0.6149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558925, 55.710064), 4326), 
                    1470143287, 96, 1.1154
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558786, 55.710014), 4326), 
                    1470143319, 98, 0.3288
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558786, 55.70991), 4326), 
                    1470143330, 99, 1.0552
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558861, 55.709995), 4326), 
                    1470143362, 100, 0.3313
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557578, 55.70897), 4326), 
                    1470143434, 100, 1.937
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557413, 55.708909), 4326), 
                    1470143436, 100, 6.1817
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55727, 55.708862), 4326), 
                    1470143442, 109, 2.2887
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557192, 55.708949), 4326), 
                    1470143451, 121, 1.7966
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557202, 55.709043), 4326), 
                    1470143457, 137, 3.187
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557341, 55.709097), 4326), 
                    1470143469, 135, 0.8971
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557313, 55.709001), 4326), 
                    1470143477, 132, 1.4033
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557172, 55.708949), 4326), 
                    1470143483, 130, 1.7909
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557022, 55.708909), 4326), 
                    1470143491, 131, 1.3056
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556914, 55.708825), 4326), 
                    1470143497, 129, 1.9509
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556849, 55.708736), 4326), 
                    1470143502, 127, 2.1773
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556734, 55.708657), 4326), 
                    1470143510, 122, 1.5516
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556569, 55.708624), 4326), 
                    1470143521, 117, 1.0959
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556458, 55.708555), 4326), 
                    1470143528, 114, 1.5401
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55628, 55.708555), 4326), 
                    1470143558, 122, 0.4575
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556155, 55.708633), 4326), 
                    1470143655, 168, 0.4893
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556338, 55.70866), 4326), 
                    1470143672, 157, 0.9511
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55647, 55.708585), 4326), 
                    1470143693, 159, 0.5673
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556297, 55.708607), 4326), 
                    1470143756, 163, 0.1874
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556452, 55.708648), 4326), 
                    1470143791, 165, 0.3118
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55658, 55.708593), 4326), 
                    1470143794, 164, 3.3781
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556736, 55.708537), 4326), 
                    1470143797, 163, 3.8771
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556906, 55.708548), 4326), 
                    1470143801, 159, 2.8605
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557075, 55.708543), 4326), 
                    1470143812, 162, 1.0017
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557246, 55.708544), 4326), 
                    1470143824, 166, 0.953
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55743, 55.708551), 4326), 
                    1470143831, 165, 1.6567
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557602, 55.708581), 4326), 
                    1470143839, 158, 1.6594
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557671, 55.708499), 4326), 
                    1470143852, 160, 0.7913
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557796, 55.708577), 4326), 
                    1470143865, 157, 0.928
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557975, 55.708579), 4326), 
                    1470143877, 168, 1.3092
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558064, 55.708481), 4326), 
                    1470143889, 153, 1.6134
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558235, 55.70849), 4326), 
                    1470143909, 152, 0.5403
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558413, 55.708489), 4326), 
                    1470143934, 160, 0.549
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558585, 55.708464), 4326), 
                    1470143942, 150, 1.8701
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558762, 55.708428), 4326), 
                    1470143947, 147, 2.433
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558898, 55.708486), 4326), 
                    1470143951, 155, 3.3372
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558957, 55.708402), 4326), 
                    1470143959, 158, 1.3104
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.5591, 55.708461), 4326), 
                    1470143971, 159, 0.9291
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559202, 55.708537), 4326), 
                    1470143981, 153, 1.2176
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559343, 55.708607), 4326), 
                    1470143993, 152, 0.9846
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559499, 55.70865), 4326), 
                    1470144006, 146, 0.9557
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559627, 55.708736), 4326), 
                    1470144026, 143, 0.6418
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559788, 55.70878), 4326), 
                    1470144044, 142, 0.6253
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559988, 55.708809), 4326), 
                    1470144054, 138, 1.3542
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560152, 55.708854), 4326), 
                    1470144060, 138, 1.9046
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560318, 55.70889), 4326), 
                    1470144067, 139, 1.5983
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560414, 55.708972), 4326), 
                    1470144079, 141, 0.9254
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560411, 55.709067), 4326), 
                    1470144130, 137, 0.2215
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560326, 55.709148), 4326), 
                    1470144148, 141, 0.6223
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560196, 55.709207), 4326), 
                    1470144164, 141, 0.6536
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560091, 55.709283), 4326), 
                    1470144169, 139, 2.1789
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559899, 55.709314), 4326), 
                    1470144181, 130, 1.2844
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559997, 55.709389), 4326), 
                    1470144194, 124, 0.9206
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560044, 55.7095), 4326), 
                    1470144207, 121, 1.003
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560189, 55.709539), 4326), 
                    1470144216, 124, 1.167
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.56035, 55.709554), 4326), 
                    1470144229, 128, 0.8444
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560518, 55.709567), 4326), 
                    1470144242, 135, 0.9786
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560689, 55.709594), 4326), 
                    1470144252, 128, 1.3144
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560853, 55.709617), 4326), 
                    1470144265, 135, 0.9763
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561009, 55.709587), 4326), 
                    1470144275, 135, 1.0326
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561168, 55.70961), 4326), 
                    1470144280, 133, 2.0953
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561318, 55.709653), 4326), 
                    1470144288, 133, 1.3179
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561493, 55.709661), 4326), 
                    1470144295, 128, 1.726
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561652, 55.709619), 4326), 
                    1470144305, 122, 1.2531
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561822, 55.709691), 4326), 
                    1470144317, 123, 1.1134
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.56166, 55.709645), 4326), 
                    1470144439, 111, 0.1355
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561497, 55.709638), 4326), 
                    1470144502, 119, 0.2063
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561328, 55.709597), 4326), 
                    1470144514, 115, 1.0168
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561161, 55.709592), 4326), 
                    1470144549, 119, 0.3204
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560987, 55.709594), 4326), 
                    1470144566, 121, 0.652
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560819, 55.709617), 4326), 
                    1470144591, 121, 0.4332
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.56066, 55.7096), 4326), 
                    1470144599, 119, 1.2917
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560498, 55.709595), 4326), 
                    1470144605, 119, 1.694
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560326, 55.709612), 4326), 
                    1470144613, 118, 1.3732
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560144, 55.709615), 4326), 
                    1470144623, 119, 1.145
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559983, 55.709587), 4326), 
                    1470144632, 119, 1.1728
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559807, 55.709578), 4326), 
                    1470144647, 119, 0.7381
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559646, 55.709557), 4326), 
                    1470144656, 117, 1.1716
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559475, 55.709546), 4326), 
                    1470144667, 115, 0.9969
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559313, 55.709581), 4326), 
                    1470144679, 109, 1.0346
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559143, 55.709581), 4326), 
                    1470144689, 118, 1.3943
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558964, 55.709576), 4326), 
                    1470144702, 119, 0.8671
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558787, 55.709581), 4326), 
                    1470144713, 117, 1.0255
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558616, 55.709574), 4326), 
                    1470144722, 118, 1.1986
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55844, 55.70957), 4326), 
                    1470144753, 105, 0.5501
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55829, 55.709611), 4326), 
                    1470144758, 105, 2.0889
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558178, 55.70968), 4326), 
                    1470144762, 111, 3.001
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558042, 55.709621), 4326), 
                    1470144769, 122, 2.1975
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557951, 55.70954), 4326), 
                    1470144777, 123, 1.3383
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557921, 55.709449), 4326), 
                    1470144782, 120, 2.144
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557803, 55.709528), 4326), 
                    1470144790, 130, 1.9032
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557699, 55.70961), 4326), 
                    1470144798, 139, 1.7966
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557548, 55.709567), 4326), 
                    1470144816, 142, 0.612
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557359, 55.709541), 4326), 
                    1470144825, 142, 1.3542
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557138, 55.709577), 4326), 
                    1470144902, 136, 0.2027
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556981, 55.709597), 4326), 
                    1470144979, 140, 0.1409
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556808, 55.709612), 4326), 
                    1470144992, 135, 0.927
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556638, 55.70961), 4326), 
                    1470145002, 135, 1.0652
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556485, 55.709572), 4326), 
                    1470145023, 134, 0.5011
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556301, 55.70956), 4326), 
                    1470145039, 131, 0.7491
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556126, 55.709584), 4326), 
                    1470145048, 128, 1.2972
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555944, 55.709593), 4326), 
                    1470145060, 126, 0.9682
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555784, 55.709601), 4326), 
                    1470145067, 125, 1.4446
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555614, 55.709635), 4326), 
                    1470145072, 123, 2.2953
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555431, 55.709654), 4326), 
                    1470145082, 125, 1.1828
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555268, 55.709662), 4326), 
                    1470145093, 122, 0.9709
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555089, 55.709661), 4326), 
                    1470145184, 117, 0.1349
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554926, 55.709665), 4326), 
                    1470145199, 122, 0.7586
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554756, 55.70967), 4326), 
                    1470145209, 121, 1.0711
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554591, 55.709697), 4326), 
                    1470145217, 121, 1.3455
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554428, 55.709694), 4326), 
                    1470145226, 119, 1.1567
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554262, 55.709704), 4326), 
                    1470145236, 121, 1.0648
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554088, 55.709707), 4326), 
                    1470145244, 117, 1.452
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553921, 55.70971), 4326), 
                    1470145257, 117, 0.8052
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553753, 55.709736), 4326), 
                    1470145308, 113, 0.2279
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553591, 55.709742), 4326), 
                    1470145315, 116, 1.5148
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553435, 55.709765), 4326), 
                    1470145323, 115, 1.2689
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553271, 55.70975), 4326), 
                    1470145331, 111, 1.3938
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553111, 55.709777), 4326), 
                    1470145339, 117, 1.5077
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552934, 55.709781), 4326), 
                    1470145349, 116, 1.1142
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552756, 55.709777), 4326), 
                    1470145356, 116, 1.5943
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552585, 55.709785), 4326), 
                    1470145364, 113, 1.395
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552415, 55.709809), 4326), 
                    1470145372, 107, 1.5639
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552256, 55.709841), 4326), 
                    1470145380, 110, 1.3743
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552093, 55.70986), 4326), 
                    1470145389, 108, 1.1797
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551931, 55.709898), 4326), 
                    1470145399, 114, 1.2524
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551766, 55.709894), 4326), 
                    1470145426, 116, 0.3903
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551604, 55.709938), 4326), 
                    1470145475, 117, 0.2308
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551446, 55.709966), 4326), 
                    1470145489, 122, 0.8227
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551282, 55.709989), 4326), 
                    1470145497, 121, 1.3293
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551123, 55.710004), 4326), 
                    1470145506, 119, 1.1439
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550949, 55.710007), 4326), 
                    1470145515, 117, 1.2319
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550784, 55.710034), 4326), 
                    1470145524, 118, 1.2011
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550612, 55.710075), 4326), 
                    1470145534, 120, 1.1869
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550449, 55.710095), 4326), 
                    1470145561, 121, 0.3888
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550278, 55.710127), 4326), 
                    1470145568, 121, 1.6125
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550121, 55.710171), 4326), 
                    1470145580, 124, 0.9489
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549974, 55.710214), 4326), 
                    1470145592, 123, 0.8687
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549818, 55.710251), 4326), 
                    1470145600, 129, 1.5229
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549653, 55.710278), 4326), 
                    1470145607, 127, 1.564
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549536, 55.710365), 4326), 
                    1470145630, 128, 0.5295
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549369, 55.710413), 4326), 
                    1470145649, 128, 0.6181
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549236, 55.710468), 4326), 
                    1470145657, 130, 1.3159
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549091, 55.710509), 4326), 
                    1470145667, 132, 1.0358
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548929, 55.710545), 4326), 
                    1470145679, 131, 0.9129
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548809, 55.710617), 4326), 
                    1470145690, 132, 1.0025
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548663, 55.710665), 4326), 
                    1470145697, 134, 1.5395
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548519, 55.710728), 4326), 
                    1470145710, 133, 0.8819
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548366, 55.710761), 4326), 
                    1470145720, 133, 1.0263
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548226, 55.710811), 4326), 
                    1470145727, 135, 1.5107
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548067, 55.710788), 4326), 
                    1470145754, 127, 0.4825
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547972, 55.71087), 4326), 
                    1470145817, 130, 0.1793
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547856, 55.710944), 4326), 
                    1470145825, 128, 1.3948
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547724, 55.711005), 4326), 
                    1470145835, 127, 1.0742
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547591, 55.711068), 4326), 
                    1470145846, 131, 1.0543
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547456, 55.711124), 4326), 
                    1470145856, 129, 1.0691
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547373, 55.711211), 4326), 
                    1470145871, 127, 0.7442
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547211, 55.711255), 4326), 
                    1470145891, 123, 0.5978
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547056, 55.711304), 4326), 
                    1470145903, 120, 0.9609
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546901, 55.711353), 4326), 
                    1470145912, 115, 1.3561
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546802, 55.71143), 4326), 
                    1470145922, 118, 1.0989
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546677, 55.711493), 4326), 
                    1470145931, 117, 1.1727
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546554, 55.711564), 4326), 
                    1470145940, 120, 1.2703
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546407, 55.711601), 4326), 
                    1470145948, 118, 1.2853
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54629, 55.711669), 4326), 
                    1470145956, 120, 1.3398
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546163, 55.711734), 4326), 
                    1470145968, 123, 0.9299
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546014, 55.711793), 4326), 
                    1470145979, 117, 1.1718
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545891, 55.711859), 4326), 
                    1470145986, 116, 1.5268
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545761, 55.711922), 4326), 
                    1470145996, 116, 1.0742
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545637, 55.711993), 4326), 
                    1470146007, 119, 1.0431
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545506, 55.712061), 4326), 
                    1470146017, 120, 1.1203
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545392, 55.712134), 4326), 
                    1470146027, 120, 1.0811
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54524, 55.712182), 4326), 
                    1470146036, 121, 1.2179
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545108, 55.712245), 4326), 
                    1470146044, 121, 1.3547
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54498, 55.7123), 4326), 
                    1470146053, 123, 1.1423
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544822, 55.712348), 4326), 
                    1470146092, 120, 0.2984
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544731, 55.712424), 4326), 
                    1470146101, 121, 1.1381
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544614, 55.712493), 4326), 
                    1470146111, 121, 1.061
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544464, 55.712545), 4326), 
                    1470146120, 122, 1.2309
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544342, 55.712608), 4326), 
                    1470146130, 124, 1.0558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544249, 55.712689), 4326), 
                    1470146142, 124, 0.8939
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544169, 55.71277), 4326), 
                    1470146155, 124, 0.7928
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544077, 55.712848), 4326), 
                    1470146164, 129, 1.2835
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543946, 55.712918), 4326), 
                    1470146173, 129, 1.2567
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543811, 55.712978), 4326), 
                    1470146182, 126, 1.2424
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543683, 55.713041), 4326), 
                    1470146191, 122, 1.2637
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543569, 55.713114), 4326), 
                    1470146199, 119, 1.4025
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543406, 55.713092), 4326), 
                    1470146211, 117, 0.8907
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543242, 55.713056), 4326), 
                    1470146239, 122, 0.4324
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543085, 55.713012), 4326), 
                    1470146254, 125, 0.7591
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542975, 55.712927), 4326), 
                    1470146269, 125, 0.7798
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543025, 55.712833), 4326), 
                    1470146290, 131, 0.593
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543131, 55.712751), 4326), 
                    1470146310, 138, 0.6638
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543215, 55.712668), 4326), 
                    1470146318, 135, 1.3799
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54315, 55.712585), 4326), 
                    1470146333, 134, 0.6758
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543154, 55.712488), 4326), 
                    1470146356, 143, 0.6109
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543105, 55.7124), 4326), 
                    1470146375, 140, 0.5624
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543134, 55.712311), 4326), 
                    1470146393, 136, 0.6015
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542998, 55.712262), 4326), 
                    1470146426, 145, 0.4102
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542852, 55.712213), 4326), 
                    1470146440, 148, 0.79
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542682, 55.712245), 4326), 
                    1470146448, 148, 1.4035
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542528, 55.71227), 4326), 
                    1470146455, 146, 1.4624
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542376, 55.712227), 4326), 
                    1470146468, 138, 1.0249
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542212, 55.712208), 4326), 
                    1470146491, 141, 0.4743
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542063, 55.712157), 4326), 
                    1470146501, 142, 1.0967
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541881, 55.712139), 4326), 
                    1470146526, 137, 0.5044
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541842, 55.71205), 4326), 
                    1470146539, 142, 0.8734
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541776, 55.71196), 4326), 
                    1470146551, 143, 0.9062
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541716, 55.711864), 4326), 
                    1470146563, 151, 1.1549
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541589, 55.711806), 4326), 
                    1470146571, 153, 1.3043
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541444, 55.711741), 4326), 
                    1470146581, 150, 1.1989
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541384, 55.711637), 4326), 
                    1470146593, 150, 1.0133
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541354, 55.711536), 4326), 
                    1470146602, 151, 1.2701
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541375, 55.711446), 4326), 
                    1470146612, 154, 1.053
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541314, 55.711353), 4326), 
                    1470146627, 150, 0.7819
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541303, 55.711258), 4326), 
                    1470146658, 166, 0.6189
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541349, 55.711166), 4326), 
                    1470146670, 167, 0.8896
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541432, 55.711082), 4326), 
                    1470146684, 164, 0.7931
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541568, 55.71103), 4326), 
                    1470146698, 167, 0.766
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541618, 55.710943), 4326), 
                    1470146707, 169, 1.1515
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541749, 55.710889), 4326), 
                    1470146718, 172, 0.9638
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541764, 55.710791), 4326), 
                    1470146737, 176, 0.6129
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541859, 55.710703), 4326), 
                    1470146754, 174, 0.6839
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541878, 55.710611), 4326), 
                    1470146764, 180, 1.1919
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541914, 55.710519), 4326), 
                    1470146773, 181, 1.1692
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542013, 55.710441), 4326), 
                    1470146783, 183, 1.0848
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542099, 55.71036), 4326), 
                    1470146792, 184, 1.1714
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542223, 55.710286), 4326), 
                    1470146809, 182, 0.676
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542309, 55.710192), 4326), 
                    1470146816, 183, 1.6859
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542434, 55.710133), 4326), 
                    1470146831, 180, 0.7098
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542503, 55.710049), 4326), 
                    1470146839, 174, 1.4892
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542574, 55.709961), 4326), 
                    1470146850, 171, 1.0145
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542643, 55.709861), 4326), 
                    1470146860, 173, 1.2097
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542725, 55.709774), 4326), 
                    1470146869, 177, 1.2956
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542767, 55.70968), 4326), 
                    1470146882, 179, 0.8433
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542607, 55.709699), 4326), 
                    1470146907, 170, 0.5454
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542457, 55.709742), 4326), 
                    1470146916, 170, 1.1715
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542322, 55.709799), 4326), 
                    1470146928, 173, 0.9155
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542168, 55.709839), 4326), 
                    1470146945, 171, 0.6359
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542048, 55.709905), 4326), 
                    1470146956, 172, 0.9594
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541889, 55.709938), 4326), 
                    1470146967, 174, 0.982
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54173, 55.709972), 4326), 
                    1470146985, 177, 0.6149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541582, 55.710019), 4326), 
                    1470146993, 176, 1.3362
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54143, 55.71005), 4326), 
                    1470147004, 177, 0.9251
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541275, 55.710089), 4326), 
                    1470147015, 178, 0.971
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541226, 55.710001), 4326), 
                    1470147066, 190, 0.3095
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541349, 55.709928), 4326), 
                    1470147081, 191, 0.7491
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54149, 55.709876), 4326), 
                    1470147093, 186, 0.9734
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541599, 55.709803), 4326), 
                    1470147106, 185, 0.8196
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541736, 55.709711), 4326), 
                    1470147141, 194, 0.4601
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.541883, 55.709654), 4326), 
                    1470147154, 191, 0.8904
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542011, 55.709599), 4326), 
                    1470147182, 187, 0.3875
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542146, 55.709527), 4326), 
                    1470147201, 184, 0.6329
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54228, 55.709466), 4326), 
                    1470147226, 186, 0.439
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542405, 55.709396), 4326), 
                    1470147241, 187, 0.7391
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542517, 55.709319), 4326), 
                    1470147473, 185, 0.0485
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542608, 55.70924), 4326), 
                    1470147481, 181, 1.4013
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542719, 55.709169), 4326), 
                    1470147491, 180, 1.0568
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542802, 55.70908), 4326), 
                    1470147501, 180, 1.1179
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542932, 55.709025), 4326), 
                    1470147510, 178, 1.1532
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543077, 55.708947), 4326), 
                    1470147515, 179, 2.5198
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54328, 55.708683), 4326), 
                    1470147517, 180, 16.0037
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54343, 55.708541), 4326), 
                    1470147519, 180, 9.1872
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543549, 55.708425), 4326), 
                    1470147521, 180, 7.449
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543698, 55.708294), 4326), 
                    1470147523, 180, 8.6504
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543873, 55.708128), 4326), 
                    1470147525, 180, 10.7344
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543964, 55.708041), 4326), 
                    1470147526, 180, 11.2288
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544057, 55.707952), 4326), 
                    1470147527, 180, 11.4841
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544139, 55.707873), 4326), 
                    1470147528, 180, 10.1763
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544126, 55.707979), 4326), 
                    1470147533, 180, 2.3643
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544507, 55.707595), 4326), 
                    1470147541, 180, 6.1147
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542261, 55.708674), 4326), 
                    1470147562, -8, 12.5707
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542994, 55.709083), 4326), 
                    1470147564, 170, 94.685
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.542975, 55.708987), 4326), 
                    1470147595, 184, 0.5692
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543102, 55.708917), 4326), 
                    1470147616, 184, 0.53
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543203, 55.708844), 4326), 
                    1470147627, 185, 0.94
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543304, 55.708769), 4326), 
                    1470147636, 185, 1.1631
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543429, 55.708703), 4326), 
                    1470147649, 185, 0.8256
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543566, 55.708632), 4326), 
                    1470147664, 185, 0.7774
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543718, 55.708589), 4326), 
                    1470147675, 184, 0.9729
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.543857, 55.708538), 4326), 
                    1470147684, 186, 1.1758
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544002, 55.708492), 4326), 
                    1470147694, 184, 1.0615
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544135, 55.708437), 4326), 
                    1470147739, 180, 0.2463
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544271, 55.708374), 4326), 
                    1470147748, 184, 1.3037
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54439, 55.708311), 4326), 
                    1470147756, 184, 1.2787
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544523, 55.708254), 4326), 
                    1470147766, 181, 1.089
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544648, 55.708182), 4326), 
                    1470147774, 178, 1.4493
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.544779, 55.708125), 4326), 
                    1470147782, 176, 1.3201
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54491, 55.708066), 4326), 
                    1470147794, 175, 0.8795
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545067, 55.708016), 4326), 
                    1470147806, 182, 1.1076
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545235, 55.707981), 4326), 
                    1470147814, 180, 1.4248
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545394, 55.707943), 4326), 
                    1470147822, 186, 1.5466
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545562, 55.70792), 4326), 
                    1470147835, 183, 0.8645
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545733, 55.707936), 4326), 
                    1470147845, 188, 1.1955
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.545894, 55.707903), 4326), 
                    1470147852, 178, 2.0957
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54604, 55.707852), 4326), 
                    1470147865, 185, 0.9876
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546177, 55.707783), 4326), 
                    1470147878, 185, 0.8856
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546353, 55.707754), 4326), 
                    1470147886, 182, 1.4842
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546516, 55.707705), 4326), 
                    1470147896, 182, 1.1574
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546687, 55.70767), 4326), 
                    1470147906, 182, 1.1398
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.546864, 55.707641), 4326), 
                    1470147915, 187, 1.3982
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547023, 55.707613), 4326), 
                    1470147926, 192, 1.052
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547124, 55.707531), 4326), 
                    1470147938, 186, 1.0514
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547271, 55.707491), 4326), 
                    1470147945, 184, 1.4887
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547452, 55.707484), 4326), 
                    1470147953, 180, 1.5062
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547625, 55.70747), 4326), 
                    1470147962, 182, 1.2367
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547791, 55.70744), 4326), 
                    1470147973, 181, 0.997
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.547976, 55.707419), 4326), 
                    1470147984, 179, 1.0901
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548124, 55.707371), 4326), 
                    1470147992, 182, 1.3889
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548296, 55.707375), 4326), 
                    1470148002, 182, 1.0785
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54849, 55.707384), 4326), 
                    1470148013, 180, 1.1235
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548609, 55.707319), 4326), 
                    1470148022, 189, 1.5268
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548773, 55.707311), 4326), 
                    1470148031, 191, 1.1672
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.548924, 55.707271), 4326), 
                    1470148045, 186, 0.8277
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549087, 55.707253), 4326), 
                    1470148056, 191, 1.0496
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549252, 55.707237), 4326), 
                    1470148065, 191, 1.1655
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54941, 55.707223), 4326), 
                    1470148078, 189, 0.786
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549587, 55.707181), 4326), 
                    1470148090, 194, 1.0858
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549656, 55.707283), 4326), 
                    1470148113, 189, 0.5708
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549814, 55.707249), 4326), 
                    1470148135, 198, 0.6319
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549979, 55.707253), 4326), 
                    1470148142, 199, 1.485
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550117, 55.707208), 4326), 
                    1470148153, 196, 0.9482
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550287, 55.7072), 4326), 
                    1470148159, 196, 1.7813
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550446, 55.707215), 4326), 
                    1470148170, 199, 0.9578
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550603, 55.707174), 4326), 
                    1470148178, 202, 1.4061
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550761, 55.707211), 4326), 
                    1470148189, 195, 1.1639
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550783, 55.707307), 4326), 
                    1470148213, 189, 0.5134
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550735, 55.707402), 4326), 
                    1470148257, 185, 0.2657
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550645, 55.707477), 4326), 
                    1470148296, 178, 0.3144
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550511, 55.707533), 4326), 
                    1470148318, 173, 0.5267
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550323, 55.707588), 4326), 
                    1470148337, 172, 0.7005
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550211, 55.707675), 4326), 
                    1470148355, 175, 0.6845
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550083, 55.707745), 4326), 
                    1470148362, 172, 1.653
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54993, 55.707801), 4326), 
                    1470148372, 171, 1.1474
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549808, 55.707862), 4326), 
                    1470148378, 171, 1.7031
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549651, 55.707891), 4326), 
                    1470148395, 161, 0.8466
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549527, 55.707962), 4326), 
                    1470148404, 161, 1.2307
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549387, 55.708009), 4326), 
                    1470148416, 157, 0.9138
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549232, 55.708099), 4326), 
                    1470148428, 158, 1.165
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54911, 55.708182), 4326), 
                    1470148433, 160, 2.4298
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.54923, 55.70825), 4326), 
                    1470148449, 161, 0.6693
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549402, 55.708242), 4326), 
                    1470148459, 153, 1.345
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549583, 55.708249), 4326), 
                    1470148467, 152, 1.4262
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549741, 55.708215), 4326), 
                    1470148474, 147, 1.6738
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.549887, 55.708258), 4326), 
                    1470148484, 157, 1.4371
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550064, 55.708259), 4326), 
                    1470148492, 161, 1.4736
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55019, 55.708325), 4326), 
                    1470148530, 154, 0.3382
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550369, 55.70834), 4326), 
                    1470148710, 154, 0.063
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550514, 55.708385), 4326), 
                    1470148726, 154, 0.6482
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550664, 55.708417), 4326), 
                    1470148731, 156, 2.0491
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550835, 55.708421), 4326), 
                    1470148744, 152, 0.8803
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.550957, 55.708359), 4326), 
                    1470148755, 154, 0.9532
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551117, 55.708377), 4326), 
                    1470148767, 158, 0.9147
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551284, 55.708369), 4326), 
                    1470148779, 155, 0.91
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551458, 55.708376), 4326), 
                    1470148798, 155, 0.5752
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551628, 55.708345), 4326), 
                    1470148806, 160, 1.5325
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55178, 55.70838), 4326), 
                    1470148820, 162, 0.7485
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.551944, 55.708395), 4326), 
                    1470148830, 162, 1.0409
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552105, 55.708392), 4326), 
                    1470148837, 162, 1.4417
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552256, 55.70835), 4326), 
                    1470148846, 154, 1.4711
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552422, 55.708309), 4326), 
                    1470148859, 162, 1.0685
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552595, 55.708278), 4326), 
                    1470148865, 155, 2.2258
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552761, 55.708271), 4326), 
                    1470148877, 153, 0.8849
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.552906, 55.708229), 4326), 
                    1470148885, 149, 1.3712
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553066, 55.708209), 4326), 
                    1470148894, 151, 1.1623
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553216, 55.708247), 4326), 
                    1470148904, 149, 1.0496
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553366, 55.708204), 4326), 
                    1470148913, 143, 1.3479
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553531, 55.708154), 4326), 
                    1470148920, 141, 1.7009
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.553711, 55.708144), 4326), 
                    1470148926, 136, 2.0642
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55388, 55.708158), 4326), 
                    1470148939, 134, 0.8374
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554008, 55.708088), 4326), 
                    1470148951, 133, 0.935
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554142, 55.708037), 4326), 
                    1470148962, 145, 1.4277
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554308, 55.70801), 4326), 
                    1470148974, 145, 0.902
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554487, 55.708014), 4326), 
                    1470148984, 149, 1.1914
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554651, 55.708017), 4326), 
                    1470148993, 152, 1.1898
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554826, 55.708033), 4326), 
                    1470149000, 151, 1.5931
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.554988, 55.708003), 4326), 
                    1470149011, 153, 0.9881
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555162, 55.708006), 4326), 
                    1470149022, 151, 1.008
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55534, 55.707998), 4326), 
                    1470149037, 146, 0.8169
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555467, 55.70794), 4326), 
                    1470149046, 155, 1.5149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555586, 55.708018), 4326), 
                    1470149080, 157, 0.3415
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555764, 55.708049), 4326), 
                    1470149085, 150, 2.722
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555933, 55.708093), 4326), 
                    1470149102, 146, 0.7253
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.555963, 55.708183), 4326), 
                    1470149110, 145, 1.2789
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556101, 55.708255), 4326), 
                    1470149116, 142, 2.0265
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556163, 55.708343), 4326), 
                    1470149120, 147, 2.9137
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556214, 55.708431), 4326), 
                    1470149129, 156, 1.5192
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556316, 55.708505), 4326), 
                    1470149137, 154, 1.3261
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556424, 55.708572), 4326), 
                    1470149140, 152, 3.4202
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55659, 55.708591), 4326), 
                    1470149160, 139, 0.8391
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556766, 55.708578), 4326), 
                    1470149165, 136, 2.3036
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556864, 55.708659), 4326), 
                    1470149172, 135, 1.5637
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556838, 55.70875), 4326), 
                    1470149180, 138, 1.3349
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.556993, 55.708796), 4326), 
                    1470149200, 127, 0.7769
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557144, 55.708844), 4326), 
                    1470149210, 129, 1.1044
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.557315, 55.708857), 4326), 
                    1470149273, 128, 0.1723
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558469, 55.709704), 4326), 
                    1470149295, 127, 5.3968
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558223, 55.709182), 4326), 
                    1470149379, 127, 0.7149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558362, 55.709252), 4326), 
                    1470149385, 130, 1.9873
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558644, 55.709466), 4326), 
                    1470149387, 130, 14.8183
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558678, 55.709564), 4326), 
                    1470149389, 130, 5.5517
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558751, 55.709652), 4326), 
                    1470149393, 130, 2.7003
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558834, 55.709759), 4326), 
                    1470149399, 124, 2.3839
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558802, 55.709855), 4326), 
                    1470149407, 104, 2.8449
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558725, 55.70994), 4326), 
                    1470149413, 87, 3.34
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558605, 55.710002), 4326), 
                    1470149418, 99, 3.1499
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558661, 55.709906), 4326), 
                    1470149440, 87, 0.7472
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.558869, 55.709883), 4326), 
                    1470149459, 97, 0.8749
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559043, 55.709855), 4326), 
                    1470149492, 113, 0.5942
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559152, 55.709931), 4326), 
                    1470149495, 114, 3.6369
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559289, 55.710041), 4326), 
                    1470149496, 113, 14.9755
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559448, 55.710135), 4326), 
                    1470149498, 113, 7.2191
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.55958, 55.710197), 4326), 
                    1470149499, 114, 10.8124
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559715, 55.710283), 4326), 
                    1470149500, 113, 12.805
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.559855, 55.710369), 4326), 
                    1470149501, 113, 12.9755
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560035, 55.710461), 4326), 
                    1470149502, 113, 15.225
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560147, 55.710539), 4326), 
                    1470149503, 113, 11.1558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560241, 55.710621), 4326), 
                    1470149504, 114, 10.9001
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560378, 55.710727), 4326), 
                    1470149505, 114, 14.5801
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560518, 55.710838), 4326), 
                    1470149506, 114, 15.1412
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560654, 55.71094), 4326), 
                    1470149507, 114, 14.1852
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560753, 55.711058), 4326), 
                    1470149508, 114, 14.5128
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560857, 55.711158), 4326), 
                    1470149509, 114, 12.8875
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.560984, 55.711239), 4326), 
                    1470149510, 114, 12.0173
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    4, ST_SetSRID(ST_MakePoint(37.561104, 55.711312), 4326), 
                    1470149511, 114, 11.0633
                );
COMMIT;
