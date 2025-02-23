-- SQL Insert Statements
BEGIN;
INSERT INTO routes (
                name, url, length, duration, 
                category, created_at
            ) VALUES (
                'Бутовский лесоп', 'бутовский-лесоп', 9084, 16120,
                'walking', 1740335252
            );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54498, 55.587204), 4326), 
                    1651576100, 184, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545583, 55.586037), 4326), 
                    1651576199, 179, 1.3665
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545631, 55.585673), 4326), 
                    1651576229, 176, 1.3579
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545887, 55.585502), 4326), 
                    1651576260, 175, 0.8039
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545909, 55.58524), 4326), 
                    1651576279, 175, 1.5351
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546219, 55.58515), 4326), 
                    1651576342, 175, 0.3477
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545563, 55.584899), 4326), 
                    1651576428, 174, 0.5789
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545312, 55.584509), 4326), 
                    1651576478, 174, 0.923
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545374, 55.584371), 4326), 
                    1651576492, 174, 1.1308
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545694, 55.584907), 4326), 
                    1651576551, 175, 1.0662
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545927, 55.585045), 4326), 
                    1651576568, 174, 1.2477
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548083, 55.585263), 4326), 
                    1651576738, 183, 0.8111
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548684, 55.585026), 4326), 
                    1651576900, 184, 0.2844
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548707, 55.58444), 4326), 
                    1651577006, 181, 0.6153
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548471, 55.584293), 4326), 
                    1651577025, 180, 1.1637
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548442, 55.584038), 4326), 
                    1651577052, 178, 1.0558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549157, 55.584119), 4326), 
                    1651577153, 180, 0.4542
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549642, 55.583728), 4326), 
                    1651577201, 179, 1.1062
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.550178, 55.583661), 4326), 
                    1651577227, 180, 1.3271
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549574, 55.583567), 4326), 
                    1651577317, 179, 0.4377
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549762, 55.583641), 4326), 
                    1651577390, 178, 0.1975
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549479, 55.583746), 4326), 
                    1651577433, 178, 0.4949
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549643, 55.583894), 4326), 
                    1651577473, 177, 0.4867
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54944, 55.584074), 4326), 
                    1651577487, 181, 1.7148
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549205, 55.584004), 4326), 
                    1651577506, 180, 0.8802
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549285, 55.583946), 4326), 
                    1651577541, 179, 0.2351
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548836, 55.584038), 4326), 
                    1651577580, 176, 0.7723
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548607, 55.58389), 4326), 
                    1651577602, 173, 1.0019
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548871, 55.583774), 4326), 
                    1651577628, 171, 0.814
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548495, 55.583724), 4326), 
                    1651577696, 171, 0.357
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.549437, 55.584003), 4326), 
                    1651577806, 178, 0.6112
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.548789, 55.584208), 4326), 
                    1651577879, 181, 0.6408
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54807, 55.584078), 4326), 
                    1651577926, 178, 1.0123
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54776, 55.583843), 4326), 
                    1651577956, 173, 1.0977
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.547686, 55.583722), 4326), 
                    1651578006, 171, 0.2875
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.547803, 55.583661), 4326), 
                    1651578054, 171, 0.2084
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.547553, 55.583934), 4326), 
                    1651578189, 172, 0.2532
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.547671, 55.584023), 4326), 
                    1651578228, 172, 0.3171
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546439, 55.58422), 4326), 
                    1651578408, 172, 0.447
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546823, 55.584603), 4326), 
                    1651578539, 177, 0.3758
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546436, 55.585017), 4326), 
                    1651578588, 180, 1.064
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545819, 55.58512), 4326), 
                    1651578684, 178, 0.4215
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545534, 55.584909), 4326), 
                    1651578712, 177, 1.0554
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544913, 55.583888), 4326), 
                    1651578865, 177, 0.7846
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544297, 55.583858), 4326), 
                    1651578933, 178, 0.5715
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544575, 55.583769), 4326), 
                    1651578981, 178, 0.4187
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544331, 55.583364), 4326), 
                    1651579036, 177, 0.8655
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545932, 55.582577), 4326), 
                    1651579293, 181, 0.5192
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546472, 55.582465), 4326), 
                    1651579393, 180, 0.3617
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546884, 55.582201), 4326), 
                    1651579449, 176, 0.7028
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54662, 55.582043), 4326), 
                    1651579515, 181, 0.3736
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54684, 55.582036), 4326), 
                    1651579562, 181, 0.2947
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544792, 55.581755), 4326), 
                    1651579767, 184, 0.6463
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544025, 55.581292), 4326), 
                    1651579877, 187, 0.6415
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54339, 55.581733), 4326), 
                    1651579960, 186, 0.7618
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.543969, 55.582045), 4326), 
                    1651580003, 185, 1.1693
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.543995, 55.582183), 4326), 
                    1651580023, 185, 0.7726
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.543726, 55.582272), 4326), 
                    1651580036, 183, 1.5148
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.543651, 55.582579), 4326), 
                    1651580069, 182, 1.0446
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54378, 55.583202), 4326), 
                    1651580126, 180, 1.2239
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544289, 55.583912), 4326), 
                    1651580201, 179, 1.136
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.543211, 55.584092), 4326), 
                    1651580278, 181, 0.9178
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.541934, 55.584645), 4326), 
                    1651580400, 184, 0.829
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540299, 55.584796), 4326), 
                    1651580578, 190, 0.5859
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538428, 55.584778), 4326), 
                    1651580671, 186, 1.2651
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537567, 55.584046), 4326), 
                    1651580862, 188, 0.5118
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537171, 55.584036), 4326), 
                    1651580930, 186, 0.3673
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.5374, 55.583911), 4326), 
                    1651580999, 186, 0.29
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537025, 55.583333), 4326), 
                    1651581109, 189, 0.6228
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536582, 55.583113), 4326), 
                    1651581163, 189, 0.6863
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536687, 55.582803), 4326), 
                    1651581313, 191, 0.2345
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536295, 55.582418), 4326), 
                    1651581369, 192, 0.8822
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536137, 55.581448), 4326), 
                    1651581479, 196, 0.9853
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535768, 55.580819), 4326), 
                    1651581548, 195, 1.068
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536946, 55.580148), 4326), 
                    1651581693, 198, 0.7253
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538045, 55.58032), 4326), 
                    1651581822, 200, 0.5558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538658, 55.580185), 4326), 
                    1651581860, 200, 1.0882
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538043, 55.579732), 4326), 
                    1651581927, 198, 0.948
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537321, 55.579529), 4326), 
                    1651581973, 197, 1.1021
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537162, 55.579166), 4326), 
                    1651582017, 202, 0.9506
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537187, 55.578785), 4326), 
                    1651582081, 203, 0.6628
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536951, 55.578941), 4326), 
                    1651582124, 204, 0.531
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536652, 55.578726), 4326), 
                    1651582278, 205, 0.1976
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536773, 55.578745), 4326), 
                    1651583401, 206, 0.0071
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536467, 55.578726), 4326), 
                    1651583502, 207, 0.1917
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537257, 55.57887), 4326), 
                    1651583640, 207, 0.3781
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537342, 55.578727), 4326), 
                    1651583665, 206, 0.6724
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537259, 55.578441), 4326), 
                    1651583716, 207, 0.6324
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53636, 55.577639), 4326), 
                    1651583828, 215, 0.9451
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536327, 55.577278), 4326), 
                    1651583894, 217, 0.6098
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53597, 55.577043), 4326), 
                    1651583943, 220, 0.7058
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535413, 55.576316), 4326), 
                    1651584029, 230, 1.0315
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535557, 55.575724), 4326), 
                    1651584086, 231, 1.1659
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53521, 55.575018), 4326), 
                    1651584188, 231, 0.7988
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535494, 55.574997), 4326), 
                    1651584354, 231, 0.1085
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535339, 55.574991), 4326), 
                    1651584385, 230, 0.317
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535573, 55.57472), 4326), 
                    1651584461, 231, 0.4415
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536459, 55.574352), 4326), 
                    1651584566, 230, 0.6583
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535646, 55.574785), 4326), 
                    1651584680, 231, 0.6159
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53634, 55.575067), 4326), 
                    1651584799, 228, 0.4522
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537102, 55.574806), 4326), 
                    1651584884, 226, 0.6592
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537723, 55.574791), 4326), 
                    1651585030, 225, 0.2677
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53803, 55.574959), 4326), 
                    1651585141, 225, 0.242
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538777, 55.574865), 4326), 
                    1651585306, 222, 0.2922
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538988, 55.574988), 4326), 
                    1651585319, 222, 1.4656
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538861, 55.575093), 4326), 
                    1651585347, 222, 0.5052
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539719, 55.575169), 4326), 
                    1651585486, 219, 0.3931
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540163, 55.575377), 4326), 
                    1651585711, 219, 0.1612
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540121, 55.575514), 4326), 
                    1651585740, 217, 0.5376
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540593, 55.575603), 4326), 
                    1651585795, 212, 0.5753
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540586, 55.57575), 4326), 
                    1651585852, 209, 0.2897
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540851, 55.575582), 4326), 
                    1651585944, 211, 0.2724
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.542095, 55.575561), 4326), 
                    1651586162, 208, 0.359
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.542344, 55.575801), 4326), 
                    1651586245, 207, 0.3732
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.541079, 55.576098), 4326), 
                    1651586407, 214, 0.5335
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539589, 55.575655), 4326), 
                    1651586539, 216, 0.8018
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539139, 55.575654), 4326), 
                    1651586577, 217, 0.7455
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538964, 55.575502), 4326), 
                    1651586635, 216, 0.3483
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537887, 55.575509), 4326), 
                    1651586851, 223, 0.3152
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536934, 55.575238), 4326), 
                    1651586967, 224, 0.5781
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536393, 55.575274), 4326), 
                    1651587046, 227, 0.4352
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535634, 55.574999), 4326), 
                    1651587158, 231, 0.5071
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535589, 55.574839), 4326), 
                    1651587170, 232, 1.5051
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53528, 55.575109), 4326), 
                    1651587288, 234, 0.3035
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.533877, 55.574), 4326), 
                    1651587783, 243, 0.3068
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.534009, 55.573782), 4326), 
                    1651587836, 245, 0.4845
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.533832, 55.573556), 4326), 
                    1651587867, 244, 0.8867
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.533753, 55.572992), 4326), 
                    1651587920, 244, 1.187
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.533866, 55.572827), 4326), 
                    1651588048, 244, 0.1537
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.534443, 55.572752), 4326), 
                    1651588200, 241, 0.2457
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536025, 55.572704), 4326), 
                    1651588277, 232, 1.2982
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53603, 55.572425), 4326), 
                    1651588356, 230, 0.3933
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537084, 55.572142), 4326), 
                    1651588593, 223, 0.3111
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537815, 55.572163), 4326), 
                    1651588656, 223, 0.7304
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538217, 55.572332), 4326), 
                    1651588728, 222, 0.4377
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538265, 55.572055), 4326), 
                    1651588766, 221, 0.8149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538402, 55.572122), 4326), 
                    1651588792, 220, 0.4394
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538936, 55.571882), 4326), 
                    1651588884, 219, 0.4662
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539354, 55.57188), 4326), 
                    1651588988, 219, 0.2528
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539593, 55.571697), 4326), 
                    1651589085, 218, 0.261
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540295, 55.571643), 4326), 
                    1651589148, 216, 0.7074
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540618, 55.571431), 4326), 
                    1651589177, 215, 1.0734
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540914, 55.571105), 4326), 
                    1651589297, 213, 0.3401
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540453, 55.570853), 4326), 
                    1651589406, 214, 0.3701
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539712, 55.570852), 4326), 
                    1651589513, 215, 0.4355
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540008, 55.571034), 4326), 
                    1651589609, 213, 0.2873
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539756, 55.571057), 4326), 
                    1651589629, 214, 0.8039
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538787, 55.570626), 4326), 
                    1651589743, 220, 0.6821
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.53874, 55.570482), 4326), 
                    1651589760, 221, 0.9584
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537992, 55.570387), 4326), 
                    1651589804, 219, 1.0959
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538129, 55.570119), 4326), 
                    1651589831, 223, 1.1554
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.538028, 55.56995), 4326), 
                    1651589850, 224, 1.0456
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537444, 55.570041), 4326), 
                    1651589910, 227, 0.6371
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536229, 55.569684), 4326), 
                    1651590038, 233, 0.6742
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536214, 55.569263), 4326), 
                    1651590211, 238, 0.2719
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535513, 55.568988), 4326), 
                    1651590268, 243, 0.9458
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.535468, 55.568751), 4326), 
                    1651590296, 246, 0.9505
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.536445, 55.568184), 4326), 
                    1651590368, 243, 1.2231
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.537164, 55.567528), 4326), 
                    1651590497, 241, 0.6654
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539252, 55.566833), 4326), 
                    1651590647, 241, 1.0156
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.539299, 55.566378), 4326), 
                    1651590693, 243, 1.1025
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.540352, 55.565525), 4326), 
                    1651590776, 242, 1.3937
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54296, 55.565071), 4326), 
                    1651590920, 246, 1.1918
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.543636, 55.564759), 4326), 
                    1651590968, 246, 1.1431
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.543508, 55.563941), 4326), 
                    1651591041, 245, 1.2511
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544338, 55.563491), 4326), 
                    1651591098, 244, 1.2685
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544806, 55.563482), 4326), 
                    1651591126, 245, 1.0518
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545043, 55.563057), 4326), 
                    1651591169, 244, 1.1525
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545344, 55.56298), 4326), 
                    1651591334, 243, 0.126
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.544995, 55.563034), 4326), 
                    1651591503, 243, 0.1346
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.54476, 55.562759), 4326), 
                    1651591525, 243, 1.5441
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.545583, 55.562371), 4326), 
                    1651591570, 242, 1.4973
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546241, 55.562633), 4326), 
                    1651591607, 242, 1.3677
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.546491, 55.562168), 4326), 
                    1651591644, 240, 1.461
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.547498, 55.561422), 4326), 
                    1651591718, 235, 1.4119
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.550355, 55.560501), 4326), 
                    1651591985, 225, 0.7754
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.551004, 55.560542), 4326), 
                    1651592007, 224, 1.8674
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.552658, 55.560211), 4326), 
                    1651592130, 220, 0.8976
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.554467, 55.560222), 4326), 
                    1651592208, 216, 1.4594
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.554719, 55.560397), 4326), 
                    1651592220, 216, 2.0914
                );
COMMIT;
