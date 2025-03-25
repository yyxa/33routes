BEGIN;
INSERT INTO routes (
                    route_id, user_id, name, url, description,
                    length, duration, tags, 
                    category, created_at, status,
                    images
                ) VALUES (
                    2, 2, 'RU: Turns of Kr', 'ru-turns-of-kr', 'Описание пока не добавлено',
                    10806, 13910, ARRAY['near_water']::tag_type[],
                    'walking', 1741996736, 'approved', ARRAY['turns_1.png', 'turns_2.png']
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.349093, 55.843803), 4326), 
                    1660751536, 176, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.347002, 55.843529), 4326), 
                    1660751767, 180, 0.5806
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.346325, 55.843287), 4326), 
                    1660751811, 181, 1.139
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.34362, 55.843251), 4326), 
                    1660751974, 182, 1.0364
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.342471, 55.84343), 4326), 
                    1660752103, 183, 0.5771
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.341986, 55.843877), 4326), 
                    1660752215, 183, 0.5197
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.342166, 55.8436), 4326), 
                    1660752263, 183, 0.6831
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.342053, 55.843532), 4326), 
                    1660752282, 183, 0.5443
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.339467, 55.843084), 4326), 
                    1660753168, 183, 0.1907
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.338033, 55.842608), 4326), 
                    1660753348, 184, 0.5778
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.337657, 55.842086), 4326), 
                    1660753391, 183, 1.4561
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.336665, 55.841672), 4326), 
                    1660753452, 182, 1.2652
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.335052, 55.841724), 4326), 
                    1660753547, 180, 1.0621
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.334723, 55.841456), 4326), 
                    1660753621, 179, 0.4893
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.333906, 55.841168), 4326), 
                    1660753685, 177, 0.9413
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.331949, 55.840616), 4326), 
                    1660753844, 170, 0.8611
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.330214, 55.840467), 4326), 
                    1660754194, 154, 0.3167
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.329955, 55.840158), 4326), 
                    1660754270, 151, 0.5015
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.329629, 55.84014), 4326), 
                    1660754319, 150, 0.4175
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.329389, 55.840255), 4326), 
                    1660754342, 151, 0.857
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.329128, 55.840788), 4326), 
                    1660754402, 151, 1.0244
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.330826, 55.842538), 4326), 
                    1660754773, 172, 0.6
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.331016, 55.843317), 4326), 
                    1660754905, 175, 0.6626
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.330946, 55.843817), 4326), 
                    1660754962, 175, 0.9785
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.331173, 55.844188), 4326), 
                    1660755014, 175, 0.8389
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.331713, 55.844607), 4326), 
                    1660755063, 172, 1.1753
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.331867, 55.845259), 4326), 
                    1660755185, 169, 0.5998
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.331186, 55.845816), 4326), 
                    1660755295, 174, 0.6843
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.331281, 55.846185), 4326), 
                    1660755356, 174, 0.6796
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.330721, 55.846799), 4326), 
                    1660755457, 174, 0.7594
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.330948, 55.847217), 4326), 
                    1660755555, 173, 0.4961
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.330393, 55.847679), 4326), 
                    1660755664, 176, 0.5692
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.329171, 55.847915), 4326), 
                    1660755805, 178, 0.5724
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.32889, 55.848363), 4326), 
                    1660755912, 178, 0.4936
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.328899, 55.848655), 4326), 
                    1660755975, 179, 0.5158
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.328121, 55.849134), 4326), 
                    1660756067, 180, 0.7835
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.327924, 55.849422), 4326), 
                    1660756081, 180, 2.4503
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.32686, 55.849845), 4326), 
                    1660756192, 180, 0.7332
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.326976, 55.849971), 4326), 
                    1660756234, 180, 0.3755
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.325936, 55.850733), 4326), 
                    1660756358, 182, 0.8609
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.322467, 55.851487), 4326), 
                    1660756586, 184, 1.0184
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.321417, 55.851012), 4326), 
                    1660756709, 183, 0.6843
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.320999, 55.851087), 4326), 
                    1660756742, 184, 0.8301
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.321141, 55.8508), 4326), 
                    1660756824, 184, 0.4039
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.320835, 55.850352), 4326), 
                    1660756865, 185, 1.3014
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.32069, 55.848362), 4326), 
                    1660757140, 182, 0.8054
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.31966, 55.847679), 4326), 
                    1660757245, 179, 0.9481
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.319539, 55.847496), 4326), 
                    1660757265, 178, 1.0864
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.319765, 55.847366), 4326), 
                    1660757300, 176, 0.5808
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.318804, 55.846718), 4326), 
                    1660757394, 169, 1.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.317862, 55.845784), 4326), 
                    1660757572, 159, 0.6733
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.317532, 55.845745), 4326), 
                    1660757609, 158, 0.5694
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.31769, 55.845776), 4326), 
                    1660757661, 158, 0.201
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.317236, 55.845995), 4326), 
                    1660757883, 156, 0.1684
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.316738, 55.846011), 4326), 
                    1660757919, 160, 0.8698
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.315804, 55.846577), 4326), 
                    1660758025, 170, 0.8159
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.315472, 55.846934), 4326), 
                    1660758063, 169, 1.179
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.314475, 55.847211), 4326), 
                    1660758196, 164, 0.5236
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.314301, 55.847433), 4326), 
                    1660758247, 164, 0.5288
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.313799, 55.847641), 4326), 
                    1660758305, 162, 0.6722
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.313094, 55.849201), 4326), 
                    1660758559, 176, 0.7067
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.312489, 55.849663), 4326), 
                    1660758633, 175, 0.8617
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.311247, 55.849968), 4326), 
                    1660758725, 165, 0.9258
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.310963, 55.850544), 4326), 
                    1660758789, 163, 1.0388
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.31063, 55.850575), 4326), 
                    1660758825, 160, 0.5924
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.310116, 55.850893), 4326), 
                    1660758973, 156, 0.324
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.30854, 55.850849), 4326), 
                    1660759092, 160, 0.8285
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.307326, 55.851177), 4326), 
                    1660759203, 171, 0.7635
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.306195, 55.851059), 4326), 
                    1660759301, 179, 0.7375
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.305076, 55.851375), 4326), 
                    1660759407, 185, 0.7397
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.305623, 55.851797), 4326), 
                    1660759483, 184, 0.7637
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.305342, 55.852316), 4326), 
                    1660759591, 183, 0.5585
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.304667, 55.852642), 4326), 
                    1660759644, 185, 1.049
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.304517, 55.852895), 4326), 
                    1660759673, 185, 1.0224
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.30325, 55.853438), 4326), 
                    1660759773, 188, 0.9953
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.302704, 55.853882), 4326), 
                    1660759830, 188, 1.0525
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.301053, 55.854577), 4326), 
                    1660760007, 191, 0.7279
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.300902, 55.854686), 4326), 
                    1660760037, 191, 0.5118
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.30103, 55.854862), 4326), 
                    1660760056, 190, 1.1135
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.30084, 55.855192), 4326), 
                    1660760086, 189, 1.2862
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299924, 55.855583), 4326), 
                    1660760164, 188, 0.921
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299548, 55.855378), 4326), 
                    1660760246, 189, 0.3992
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299434, 55.85568), 4326), 
                    1660760326, 188, 0.4293
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299639, 55.855952), 4326), 
                    1660760387, 188, 0.5384
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299557, 55.856211), 4326), 
                    1660760419, 189, 0.9143
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299469, 55.856139), 4326), 
                    1660760457, 189, 0.2555
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299581, 55.856022), 4326), 
                    1660760484, 188, 0.5478
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.299362, 55.855829), 4326), 
                    1660760523, 188, 0.6525
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.297664, 55.855386), 4326), 
                    1660760673, 190, 0.7792
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.297218, 55.855796), 4326), 
                    1660760756, 189, 0.6436
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.29677, 55.856617), 4326), 
                    1660760854, 191, 0.9744
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.296779, 55.85717), 4326), 
                    1660760917, 191, 0.9761
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.296503, 55.857592), 4326), 
                    1660760940, 191, 2.1733
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.296649, 55.857922), 4326), 
                    1660760986, 191, 0.8219
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.29651, 55.858253), 4326), 
                    1660761039, 191, 0.7135
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.296749, 55.858307), 4326), 
                    1660761068, 191, 0.5544
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.29643, 55.857942), 4326), 
                    1660761124, 190, 0.8073
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.295305, 55.857805), 4326), 
                    1660761215, 190, 0.7895
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.294052, 55.857365), 4326), 
                    1660761290, 191, 1.23
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.293509, 55.856894), 4326), 
                    1660761332, 191, 1.4852
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.292238, 55.856252), 4326), 
                    1660761449, 183, 0.9146
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.289157, 55.855855), 4326), 
                    1660761640, 180, 1.033
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.288056, 55.855979), 4326), 
                    1660761679, 179, 1.7972
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.287808, 55.856121), 4326), 
                    1660761705, 179, 0.8505
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.288257, 55.855979), 4326), 
                    1660761794, 180, 0.3616
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.288099, 55.855938), 4326), 
                    1660761808, 180, 0.776
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.288008, 55.85546), 4326), 
                    1660761867, 179, 0.9061
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.287646, 55.855156), 4326), 
                    1660761900, 179, 1.2321
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.287547, 55.854773), 4326), 
                    1660761941, 180, 1.0497
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.287207, 55.854477), 4326), 
                    1660761984, 180, 0.9107
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.288909, 55.853555), 4326), 
                    1660762122, 188, 1.0713
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.289786, 55.853279), 4326), 
                    1660762208, 190, 0.7301
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.290081, 55.852811), 4326), 
                    1660762264, 190, 0.9857
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.289944, 55.852422), 4326), 
                    1660762304, 190, 1.1023
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.29024, 55.852173), 4326), 
                    1660762327, 189, 1.4473
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.289817, 55.852612), 4326), 
                    1660762389, 190, 0.8951
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.289468, 55.852749), 4326), 
                    1660762415, 189, 1.0225
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.28895, 55.852703), 4326), 
                    1660762441, 188, 1.2593
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.288866, 55.852425), 4326), 
                    1660762485, 186, 0.7139
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.288321, 55.851885), 4326), 
                    1660762532, 182, 1.4716
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.287987, 55.850933), 4326), 
                    1660762628, 178, 1.1245
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.287694, 55.8508), 4326), 
                    1660762646, 181, 1.3146
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.28604, 55.851452), 4326), 
                    1660762759, 186, 1.1174
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.285103, 55.851504), 4326), 
                    1660762810, 188, 1.1527
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.284315, 55.851235), 4326), 
                    1660762866, 189, 1.0282
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.283526, 55.850387), 4326), 
                    1660762951, 189, 1.2515
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.283538, 55.849936), 4326), 
                    1660763002, 188, 0.9837
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.283351, 55.849513), 4326), 
                    1660763041, 186, 1.2431
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.284302, 55.849217), 4326), 
                    1660763113, 182, 0.9444
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.283572, 55.848941), 4326), 
                    1660763167, 186, 1.0198
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.282798, 55.848336), 4326), 
                    1660763225, 187, 1.4282
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.281684, 55.848684), 4326), 
                    1660763316, 186, 0.8746
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.281561, 55.848474), 4326), 
                    1660763351, 186, 0.7024
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.281222, 55.848396), 4326), 
                    1660763367, 186, 1.4294
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.281177, 55.848707), 4326), 
                    1660763415, 185, 0.7229
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.280813, 55.848867), 4326), 
                    1660763440, 185, 1.1543
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.280528, 55.84928), 4326), 
                    1660763481, 186, 1.2014
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.280236, 55.849423), 4326), 
                    1660763499, 186, 1.3438
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.279454, 55.849463), 4326), 
                    1660763540, 187, 1.1956
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.278806, 55.848755), 4326), 
                    1660763612, 187, 1.2293
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.276018, 55.84721), 4326), 
                    1660763923, 191, 0.7864
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.271946, 55.846785), 4326), 
                    1660764139, 194, 1.1971
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.270191, 55.845458), 4326), 
                    1660764285, 194, 1.2588
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.268693, 55.844811), 4326), 
                    1660764376, 190, 1.297
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.268442, 55.84416), 4326), 
                    1660764480, 187, 0.7128
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.268971, 55.843573), 4326), 
                    1660764537, 180, 1.2897
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.268691, 55.842725), 4326), 
                    1660764607, 171, 1.3755
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.267951, 55.842161), 4326), 
                    1660764726, 167, 0.6558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.267637, 55.841562), 4326), 
                    1660764851, 168, 0.5555
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.265517, 55.839949), 4326), 
                    1660765051, 182, 1.1168
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.265188, 55.83939), 4326), 
                    1660765114, 181, 1.0392
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.26489, 55.8382), 4326), 
                    1660765222, 183, 1.2374
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.264325, 55.837493), 4326), 
                    1660765308, 185, 1.0023
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.264316, 55.83727), 4326), 
                    1660765330, 186, 1.1281
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.264575, 55.83698), 4326), 
                    1660765352, 187, 1.6402
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.26488, 55.836879), 4326), 
                    1660765382, 188, 0.7376
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.264995, 55.836476), 4326), 
                    1660765412, 188, 1.5129
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    2, ST_SetSRID(ST_MakePoint(37.265448, 55.836159), 4326), 
                    1660765446, 189, 1.3294
                );
COMMIT;
