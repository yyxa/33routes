BEGIN;
INSERT INTO routes (
                    route_id, user_id, name, url, description,
                    length, duration, tags, 
                    category, created_at, status,
                    images
                ) VALUES (
                    7, 7, 'Коломенское', 'kolomenskoe', 'Описание пока не добавлено',
                    13027, 19643, ARRAY['park', 'near_water']::tag_type[],
                    'walking', 1741996736, 'approved', ARRAY['kolomenskoe_1.png', 'kolomenskoe_2.png']
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.655213, 55.656016), 4326), 
                    1621682047, 152, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.655116, 55.656063), 4326), 
                    1621682049, 163, 6.567
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.65582, 55.656342), 4326), 
                    1621682141, 163, 0.5866
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.656527, 55.65622), 4326), 
                    1621682177, 163, 1.2885
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.656716, 55.656379), 4326), 
                    1621682219, 163, 0.5068
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.656466, 55.656687), 4326), 
                    1621682272, 163, 0.7108
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.656555, 55.656754), 4326), 
                    1621682285, 162, 0.7172
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.656468, 55.656525), 4326), 
                    1621682304, 163, 1.3718
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.65671, 55.65634), 4326), 
                    1621682324, 164, 1.2785
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.656271, 55.656175), 4326), 
                    1621682349, 164, 1.3238
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.656396, 55.655905), 4326), 
                    1621682373, 165, 1.2931
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657157, 55.655519), 4326), 
                    1621682459, 165, 0.7465
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657513, 55.655892), 4326), 
                    1621682623, 165, 0.2872
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657238, 55.65608), 4326), 
                    1621682644, 164, 1.291
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657017, 55.655961), 4326), 
                    1621682691, 165, 0.4084
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657279, 55.655995), 4326), 
                    1621682709, 165, 0.9369
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657789, 55.655667), 4326), 
                    1621682765, 164, 0.8666
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657994, 55.655762), 4326), 
                    1621682783, 165, 0.9262
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.658098, 55.655641), 4326), 
                    1621682818, 163, 0.4297
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.658245, 55.655325), 4326), 
                    1621682852, 163, 1.0685
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657989, 55.655125), 4326), 
                    1621682952, 165, 0.2749
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.658584, 55.655032), 4326), 
                    1621682997, 165, 0.8608
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659492, 55.654589), 4326), 
                    1621683056, 164, 1.2765
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659575, 55.654515), 4326), 
                    1621683068, 164, 0.8116
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659445, 55.654467), 4326), 
                    1621683126, 164, 0.168
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659454, 55.654282), 4326), 
                    1621683155, 164, 0.7096
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66067, 55.654237), 4326), 
                    1621683237, 162, 0.9327
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661397, 55.653525), 4326), 
                    1621683323, 162, 1.0625
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661499, 55.653182), 4326), 
                    1621683352, 163, 1.3336
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661352, 55.653002), 4326), 
                    1621683371, 163, 1.16
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660801, 55.652873), 4326), 
                    1621683401, 164, 1.248
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659245, 55.653204), 4326), 
                    1621683485, 166, 1.2423
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659065, 55.653049), 4326), 
                    1621683498, 167, 1.5855
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659171, 55.651477), 4326), 
                    1621683618, 168, 1.4577
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.65953, 55.651253), 4326), 
                    1621683642, 168, 1.3993
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660347, 55.651402), 4326), 
                    1621683680, 167, 1.418
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660764, 55.65131), 4326), 
                    1621683704, 167, 1.1707
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661845, 55.652249), 4326), 
                    1621683799, 164, 1.311
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661975, 55.652435), 4326), 
                    1621683815, 164, 1.3896
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661785, 55.652488), 4326), 
                    1621683821, 164, 2.2168
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.662616, 55.652885), 4326), 
                    1621683899, 163, 0.8759
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.663778, 55.654646), 4326), 
                    1621684071, 160, 1.2149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.664191, 55.654952), 4326), 
                    1621684100, 159, 1.4749
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665339, 55.655188), 4326), 
                    1621684155, 158, 1.394
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665676, 55.655039), 4326), 
                    1621684175, 158, 1.343
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665655, 55.654786), 4326), 
                    1621684209, 160, 0.8304
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66583, 55.654616), 4326), 
                    1621684233, 161, 0.9118
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665686, 55.65509), 4326), 
                    1621684362, 158, 0.4149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665232, 55.65519), 4326), 
                    1621684380, 157, 1.6999
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.664837, 55.655077), 4326), 
                    1621684399, 157, 1.4624
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.664398, 55.655266), 4326), 
                    1621684451, 157, 0.6662
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665093, 55.655469), 4326), 
                    1621684513, 150, 0.8006
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665022, 55.655692), 4326), 
                    1621684615, 161, 0.2699
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.664774, 55.655843), 4326), 
                    1621684651, 160, 0.6363
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.664898, 55.655975), 4326), 
                    1621684667, 158, 1.043
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665245, 55.6561), 4326), 
                    1621684718, 158, 0.5065
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665424, 55.655881), 4326), 
                    1621684868, 156, 0.1793
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665841, 55.656699), 4326), 
                    1621684978, 143, 0.8684
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666388, 55.657042), 4326), 
                    1621685029, 135, 1.0193
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667251, 55.657242), 4326), 
                    1621685086, 123, 1.0461
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66757, 55.657467), 4326), 
                    1621685113, 123, 1.1866
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667505, 55.657606), 4326), 
                    1621685130, 124, 0.9415
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667804, 55.657693), 4326), 
                    1621685288, 122, 0.1342
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668504, 55.658316), 4326), 
                    1621685356, 120, 1.2066
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669165, 55.658587), 4326), 
                    1621685399, 120, 1.192
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669477, 55.659425), 4326), 
                    1621685471, 120, 1.3224
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669426, 55.659908), 4326), 
                    1621685578, 120, 0.5028
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669649, 55.660332), 4326), 
                    1621685618, 119, 1.2295
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670087, 55.660663), 4326), 
                    1621685653, 120, 1.3124
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.67006, 55.660942), 4326), 
                    1621685673, 120, 1.5539
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668335, 55.661051), 4326), 
                    1621685812, 122, 0.7833
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667713, 55.661306), 4326), 
                    1621685875, 126, 0.7684
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667486, 55.661814), 4326), 
                    1621686005, 134, 0.4529
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66726, 55.661885), 4326), 
                    1621686024, 138, 0.8715
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666862, 55.661697), 4326), 
                    1621686088, 144, 0.5188
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666769, 55.661865), 4326), 
                    1621686130, 150, 0.4867
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666444, 55.6618), 4326), 
                    1621686189, 156, 0.3787
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666362, 55.661975), 4326), 
                    1621686226, 156, 0.5445
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666152, 55.66193), 4326), 
                    1621686274, 156, 0.294
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666631, 55.662426), 4326), 
                    1621686394, 155, 0.5234
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66736, 55.662779), 4326), 
                    1621686462, 153, 0.8865
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667899, 55.662993), 4326), 
                    1621686487, 152, 1.6546
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668153, 55.662861), 4326), 
                    1621686539, 152, 0.4166
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668669, 55.66365), 4326), 
                    1621686601, 149, 1.5087
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668679, 55.663917), 4326), 
                    1621686626, 148, 1.1885
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667551, 55.664076), 4326), 
                    1621686842, 147, 0.3377
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667033, 55.664596), 4326), 
                    1621687011, 127, 0.4091
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.6661, 55.664612), 4326), 
                    1621687182, 127, 0.3424
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666759, 55.664535), 4326), 
                    1621687263, 126, 0.5211
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667004, 55.664753), 4326), 
                    1621687298, 123, 0.8251
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667833, 55.665027), 4326), 
                    1621687382, 125, 0.7179
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669706, 55.664998), 4326), 
                    1621687483, 121, 1.1642
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671264, 55.665116), 4326), 
                    1621687556, 121, 1.3506
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671435, 55.665245), 4326), 
                    1621687568, 122, 1.4948
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671284, 55.665477), 4326), 
                    1621687601, 122, 0.8329
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671526, 55.665635), 4326), 
                    1621687624, 126, 1.0196
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671516, 55.666022), 4326), 
                    1621687676, 132, 0.8359
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671401, 55.666357), 4326), 
                    1621687710, 136, 1.1221
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671021, 55.666679), 4326), 
                    1621687776, 141, 0.6566
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669774, 55.666663), 4326), 
                    1621687871, 146, 0.8248
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668682, 55.666471), 4326), 
                    1621689125, 148, 0.0572
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668948, 55.666494), 4326), 
                    1621689255, 148, 0.1298
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669213, 55.666749), 4326), 
                    1621689280, 149, 1.3154
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66991, 55.668034), 4326), 
                    1621689542, 150, 0.5703
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670096, 55.66806), 4326), 
                    1621689580, 149, 0.3176
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669398, 55.668068), 4326), 
                    1621689648, 152, 0.645
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669747, 55.668131), 4326), 
                    1621689674, 151, 0.8843
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670365, 55.669304), 4326), 
                    1621689792, 144, 1.1545
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670525, 55.669275), 4326), 
                    1621689801, 144, 1.1723
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670861, 55.66959), 4326), 
                    1621689867, 142, 0.6198
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671006, 55.670097), 4326), 
                    1621689908, 139, 1.3953
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.67048, 55.670078), 4326), 
                    1621689934, 136, 1.2765
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670761, 55.670231), 4326), 
                    1621690134, 140, 0.1239
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670692, 55.670075), 4326), 
                    1621690137, 140, 5.9594
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670941, 55.670101), 4326), 
                    1621690161, 139, 0.6627
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671266, 55.670521), 4326), 
                    1621690288, 136, 0.4019
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670974, 55.670622), 4326), 
                    1621690330, 136, 0.5115
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671756, 55.670366), 4326), 
                    1621690696, 135, 0.1549
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672145, 55.669613), 4326), 
                    1621690772, 136, 1.1475
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673306, 55.668948), 4326), 
                    1621690858, 124, 1.2148
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673574, 55.668983), 4326), 
                    1621690870, 123, 1.4405
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673322, 55.668447), 4326), 
                    1621690915, 121, 1.3705
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673061, 55.668437), 4326), 
                    1621691023, 123, 0.1527
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673308, 55.668235), 4326), 
                    1621691121, 120, 0.2799
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673171, 55.668045), 4326), 
                    1621691151, 120, 0.7604
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673271, 55.667756), 4326), 
                    1621691173, 119, 1.4883
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672881, 55.667362), 4326), 
                    1621691308, 119, 0.3717
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672636, 55.666846), 4326), 
                    1621691439, 118, 0.4534
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672155, 55.666672), 4326), 
                    1621691484, 120, 0.7975
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671678, 55.664901), 4326), 
                    1621691671, 118, 1.0652
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670396, 55.665237), 4326), 
                    1621691770, 124, 0.8975
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666915, 55.664888), 4326), 
                    1621691976, 126, 1.0765
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666562, 55.664611), 4326), 
                    1621692028, 129, 0.7326
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666076, 55.664636), 4326), 
                    1621692068, 130, 0.7652
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665731, 55.664401), 4326), 
                    1621692099, 128, 1.0961
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665375, 55.664418), 4326), 
                    1621692218, 127, 0.1883
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.664551, 55.664106), 4326), 
                    1621692331, 132, 0.5521
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.663906, 55.663751), 4326), 
                    1621692372, 132, 1.3787
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.663716, 55.663485), 4326), 
                    1621692414, 133, 0.7594
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.662858, 55.663367), 4326), 
                    1621692502, 135, 0.6298
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.662027, 55.663051), 4326), 
                    1621692640, 136, 0.4555
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.662178, 55.66286), 4326), 
                    1621692728, 142, 0.2747
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661547, 55.663039), 4326), 
                    1621692820, 137, 0.4851
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660925, 55.66274), 4326), 
                    1621692856, 138, 1.424
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659973, 55.662643), 4326), 
                    1621692908, 139, 1.1673
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.658651, 55.66188), 4326), 
                    1621693066, 142, 0.7511
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657961, 55.661787), 4326), 
                    1621693127, 142, 0.7295
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.65737, 55.661852), 4326), 
                    1621693204, 144, 0.4909
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657377, 55.661946), 4326), 
                    1621693244, 151, 0.3247
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657587, 55.66222), 4326), 
                    1621693280, 156, 0.9316
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.658553, 55.662155), 4326), 
                    1621693377, 156, 0.6291
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657522, 55.662446), 4326), 
                    1621693602, 158, 0.3215
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.65748, 55.662598), 4326), 
                    1621693619, 157, 1.0064
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.657752, 55.662808), 4326), 
                    1621693639, 158, 1.4468
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.658463, 55.662874), 4326), 
                    1621693673, 157, 1.3295
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.658522, 55.662641), 4326), 
                    1621693692, 157, 1.3775
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659293, 55.663059), 4326), 
                    1621693784, 157, 0.7291
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659818, 55.663113), 4326), 
                    1621693809, 157, 1.3391
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660109, 55.662811), 4326), 
                    1621693840, 152, 1.2403
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660107, 55.662965), 4326), 
                    1621693874, 156, 0.5124
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.659825, 55.663159), 4326), 
                    1621693891, 157, 1.6433
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660768, 55.663294), 4326), 
                    1621693943, 157, 1.1735
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660855, 55.663751), 4326), 
                    1621694059, 159, 0.4409
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66116, 55.663455), 4326), 
                    1621694211, 157, 0.2508
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.662611, 55.663957), 4326), 
                    1621694291, 155, 1.3347
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.662086, 55.664657), 4326), 
                    1621694357, 159, 1.282
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661219, 55.665157), 4326), 
                    1621694454, 160, 0.8017
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.661213, 55.665371), 4326), 
                    1621694473, 161, 1.2533
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.660853, 55.665885), 4326), 
                    1621694563, 165, 0.6842
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665164, 55.666506), 4326), 
                    1621694997, 162, 0.643
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666074, 55.666937), 4326), 
                    1621695048, 163, 1.4616
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666592, 55.667043), 4326), 
                    1621695092, 164, 0.7855
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666605, 55.66691), 4326), 
                    1621695101, 164, 1.646
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66677, 55.666934), 4326), 
                    1621695133, 164, 0.3341
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.66724, 55.6672), 4326), 
                    1621695180, 164, 0.8885
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667212, 55.667344), 4326), 
                    1621695222, 165, 0.385
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667675, 55.667702), 4326), 
                    1621695272, 165, 0.9855
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667519, 55.667975), 4326), 
                    1621695294, 165, 1.4497
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.667613, 55.66843), 4326), 
                    1621695372, 164, 0.653
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666365, 55.669398), 4326), 
                    1621695545, 161, 0.7694
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666176, 55.669396), 4326), 
                    1621695552, 162, 1.6935
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665881, 55.669074), 4326), 
                    1621695576, 163, 1.6807
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666191, 55.668988), 4326), 
                    1621695613, 163, 0.5858
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666207, 55.669375), 4326), 
                    1621695664, 162, 0.8441
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.665704, 55.66968), 4326), 
                    1621695701, 160, 1.2532
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666254, 55.669946), 4326), 
                    1621695783, 157, 0.5549
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666351, 55.66956), 4326), 
                    1621695821, 160, 1.1432
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.666885, 55.669727), 4326), 
                    1621695844, 159, 1.6659
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668248, 55.669154), 4326), 
                    1621695962, 159, 0.9035
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669057, 55.669672), 4326), 
                    1621696066, 155, 0.7392
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.668969, 55.669907), 4326), 
                    1621696152, 154, 0.3106
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670722, 55.671011), 4326), 
                    1621696316, 145, 1.0066
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670723, 55.671224), 4326), 
                    1621696329, 144, 1.822
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671528, 55.672368), 4326), 
                    1621696479, 143, 0.9124
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671795, 55.672475), 4326), 
                    1621696500, 142, 0.9781
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671112, 55.672547), 4326), 
                    1621696566, 143, 0.6603
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670143, 55.672902), 4326), 
                    1621696630, 144, 1.1322
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669804, 55.67325), 4326), 
                    1621696659, 145, 1.5227
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670142, 55.673879), 4326), 
                    1621696714, 145, 1.3288
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.669424, 55.674061), 4326), 
                    1621696794, 145, 0.617
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670215, 55.673918), 4326), 
                    1621696917, 145, 0.4235
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670332, 55.674084), 4326), 
                    1621696945, 144, 0.7094
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670479, 55.674031), 4326), 
                    1621696971, 144, 0.4208
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670786, 55.674766), 4326), 
                    1621697065, 142, 0.8935
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.670987, 55.67499), 4326), 
                    1621697085, 142, 1.3957
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671178, 55.674885), 4326), 
                    1621697128, 143, 0.389
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671253, 55.675169), 4326), 
                    1621697191, 142, 0.5071
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671079, 55.675291), 4326), 
                    1621697203, 142, 1.4507
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671127, 55.675491), 4326), 
                    1621697219, 140, 1.4043
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671565, 55.675974), 4326), 
                    1621697262, 138, 1.4039
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672399, 55.67574), 4326), 
                    1621697314, 141, 1.1245
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.67322, 55.675212), 4326), 
                    1621697413, 143, 0.7889
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672701, 55.674513), 4326), 
                    1621697477, 143, 1.3166
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672751, 55.674366), 4326), 
                    1621697488, 141, 1.5192
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673281, 55.674153), 4326), 
                    1621697514, 141, 1.5697
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673376, 55.673967), 4326), 
                    1621697539, 141, 0.8609
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.675272, 55.6735), 4326), 
                    1621697656, 138, 1.1091
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.674867, 55.673154), 4326), 
                    1621697691, 138, 1.3171
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.67504, 55.673009), 4326), 
                    1621697802, 137, 0.1752
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.674814, 55.672708), 4326), 
                    1621697822, 137, 1.8174
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.675301, 55.673143), 4326), 
                    1621697873, 137, 1.1217
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.675837, 55.672904), 4326), 
                    1621697911, 136, 1.1279
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.675746, 55.672824), 4326), 
                    1621697919, 136, 1.3239
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.676092, 55.672937), 4326), 
                    1621697957, 135, 0.6599
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.676505, 55.672749), 4326), 
                    1621698000, 131, 0.7798
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.676546, 55.672832), 4326), 
                    1621698013, 132, 0.741
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.676623, 55.672575), 4326), 
                    1621698050, 130, 0.7848
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.677044, 55.672472), 4326), 
                    1621698070, 130, 1.439
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.676658, 55.672037), 4326), 
                    1621698121, 130, 1.0606
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.679077, 55.671829), 4326), 
                    1621698265, 130, 1.0656
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.679803, 55.671672), 4326), 
                    1621698299, 129, 1.4343
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680575, 55.671287), 4326), 
                    1621698352, 128, 1.2196
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680118, 55.671611), 4326), 
                    1621698393, 128, 1.1229
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.681321, 55.671824), 4326), 
                    1621698510, 130, 0.6759
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680888, 55.671743), 4326), 
                    1621698538, 130, 1.0217
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680737, 55.672038), 4326), 
                    1621698562, 130, 1.4227
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680876, 55.672088), 4326), 
                    1621698569, 130, 1.4769
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680627, 55.672141), 4326), 
                    1621698625, 130, 0.298
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680826, 55.671764), 4326), 
                    1621698704, 131, 0.5537
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680417, 55.671723), 4326), 
                    1621698726, 130, 1.1843
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.680162, 55.672042), 4326), 
                    1621698794, 130, 0.5722
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.679755, 55.672231), 4326), 
                    1621698880, 131, 0.3845
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.67968, 55.67254), 4326), 
                    1621698907, 131, 1.2846
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.679992, 55.672619), 4326), 
                    1621698927, 132, 1.0725
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.679336, 55.672481), 4326), 
                    1621699040, 132, 0.3886
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.679242, 55.672659), 4326), 
                    1621699056, 132, 1.2908
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.677943, 55.672762), 4326), 
                    1621699128, 131, 1.1426
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.678712, 55.672941), 4326), 
                    1621700411, 133, 0.0407
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.678839, 55.673174), 4326), 
                    1621700437, 135, 1.0453
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.678143, 55.673231), 4326), 
                    1621700617, 134, 0.2451
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.678187, 55.673654), 4326), 
                    1621700701, 137, 0.5625
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.677594, 55.674152), 4326), 
                    1621700946, 137, 0.2722
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.677079, 55.6739), 4326), 
                    1621701010, 137, 0.6681
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.677014, 55.673025), 4326), 
                    1621701148, 133, 0.7062
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.675821, 55.673099), 4326), 
                    1621701231, 140, 0.9105
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.675683, 55.673297), 4326), 
                    1621701278, 141, 0.5036
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.67537, 55.673385), 4326), 
                    1621701291, 141, 1.687
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.67564, 55.6735), 4326), 
                    1621701310, 141, 1.1167
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673008, 55.674276), 4326), 
                    1621701448, 145, 1.3497
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.672798, 55.674488), 4326), 
                    1621701470, 144, 1.2274
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.673426, 55.675447), 4326), 
                    1621701554, 145, 1.3533
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671333, 55.676025), 4326), 
                    1621701651, 141, 1.507
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671568, 55.676073), 4326), 
                    1621701664, 141, 1.2061
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    7, ST_SetSRID(ST_MakePoint(37.671717, 55.6763), 4326), 
                    1621701690, 140, 1.0353
                );
COMMIT;
