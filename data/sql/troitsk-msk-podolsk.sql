BEGIN;
INSERT INTO routes (
                    route_id, user_id, name, url, description,
                    length, duration, tags, 
                    category, created_at, status,
                    images
                ) VALUES (
                    3, 1, 'Троицк мск - По', 'troitsk-msk-po', 'Описание пока не добавлено',
                    28270, 37292, ARRAY['forest']::tag_type[],
                    'walking', 1741996736, 'approved', ARRAY['troitsk_1.png']
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.297992, 55.486983), 4326), 
                    1731385427, 176, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.303077, 55.484151), 4326), 
                    1731385431, 176, 106.2761
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.304567, 55.484557), 4326), 
                    1731385507, 177, 1.3798
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.304577, 55.484796), 4326), 
                    1731385520, 173, 2.0615
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.304242, 55.484893), 4326), 
                    1731385531, 179, 2.2163
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.3046, 55.48579), 4326), 
                    1731385580, 174, 2.09
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.306014, 55.486047), 4326), 
                    1731385632, 171, 1.7997
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.306052, 55.485735), 4326), 
                    1731385652, 171, 1.739
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.306493, 55.485057), 4326), 
                    1731385702, 171, 1.6069
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.306746, 55.484145), 4326), 
                    1731385762, 175, 1.7124
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.306456, 55.483921), 4326), 
                    1731385783, 175, 1.4712
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.304466, 55.483599), 4326), 
                    1731385862, 174, 1.6506
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.303836, 55.483139), 4326), 
                    1731385900, 176, 1.705
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.300498, 55.478812), 4326), 
                    1731386253, 183, 1.4877
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.298605, 55.477065), 4326), 
                    1731386384, 187, 1.7405
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.29776, 55.476541), 4326), 
                    1731386433, 188, 1.6111
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.296913, 55.475695), 4326), 
                    1731386496, 184, 1.7184
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.2954, 55.474562), 4326), 
                    1731386610, 190, 1.387
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.295684, 55.473877), 4326), 
                    1731386665, 192, 1.4233
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.295453, 55.474055), 4326), 
                    1731386689, 191, 1.0248
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.294903, 55.474129), 4326), 
                    1731386720, 193, 1.1518
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.290981, 55.470944), 4326), 
                    1731386990, 184, 1.5999
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.291144, 55.4705), 4326), 
                    1731387022, 192, 1.5941
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.291447, 55.470309), 4326), 
                    1731387038, 190, 1.7873
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.291326, 55.470166), 4326), 
                    1731387051, 182, 1.5059
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.291441, 55.470022), 4326), 
                    1731387064, 182, 1.352
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.29139, 55.469716), 4326), 
                    1731387085, 194, 1.7233
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.292489, 55.467405), 4326), 
                    1731387236, 193, 1.7625
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.292383, 55.4672), 4326), 
                    1731387251, 185, 1.6607
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.292652, 55.466521), 4326), 
                    1731387304, 195, 1.4703
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.293687, 55.466122), 4326), 
                    1731387352, 194, 1.6437
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.294797, 55.466263), 4326), 
                    1731387424, 187, 1.0006
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.295126, 55.465986), 4326), 
                    1731387477, 191, 0.7047
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.295016, 55.466126), 4326), 
                    1731387497, 193, 0.8558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.295164, 55.466188), 4326), 
                    1731387505, 193, 1.4514
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.296314, 55.466165), 4326), 
                    1731387560, 200, 1.325
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.297101, 55.467228), 4326), 
                    1731387674, 201, 1.1245
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.297558, 55.467318), 4326), 
                    1731387690, 203, 1.9093
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.296982, 55.468294), 4326), 
                    1731387767, 195, 1.4897
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.298492, 55.468253), 4326), 
                    1731388022, 191, 0.374
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.297505, 55.468385), 4326), 
                    1731388026, 229, 18.5019
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.2971, 55.468293), 4326), 
                    1731388069, 199, 0.9482
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.297716, 55.467272), 4326), 
                    1731388161, 194, 1.305
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.29945, 55.467271), 4326), 
                    1731388240, 207, 1.3928
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.301312, 55.466781), 4326), 
                    1731388317, 201, 1.6822
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.301895, 55.467258), 4326), 
                    1731388427, 197, 0.5879
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.302953, 55.467045), 4326), 
                    1731388616, 192, 0.3753
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.303357, 55.467278), 4326), 
                    1731388650, 196, 1.0729
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.304633, 55.46722), 4326), 
                    1731388748, 200, 0.8246
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.305165, 55.466908), 4326), 
                    1731388859, 192, 0.4406
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.30558, 55.466881), 4326), 
                    1731388878, 196, 1.3987
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.306411, 55.466149), 4326), 
                    1731388948, 202, 1.3861
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.306696, 55.464951), 4326), 
                    1731389045, 193, 1.3894
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.308106, 55.463111), 4326), 
                    1731389292, 201, 0.9037
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.309106, 55.462971), 4326), 
                    1731389343, 202, 1.2734
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.313289, 55.461892), 4326), 
                    1731389592, 203, 1.1635
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.319372, 55.460195), 4326), 
                    1731389897, 183, 1.4028
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.319443, 55.459907), 4326), 
                    1731389915, 188, 1.8115
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.319944, 55.459384), 4326), 
                    1731389969, 183, 1.2285
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.32136, 55.458808), 4326), 
                    1731390061, 192, 1.1984
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.321869, 55.458322), 4326), 
                    1731390102, 193, 1.5331
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.32221, 55.458189), 4326), 
                    1731390124, 188, 1.2086
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.32285, 55.457421), 4326), 
                    1731390189, 188, 1.4531
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.324212, 55.45675), 4326), 
                    1731390278, 190, 1.2785
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.325722, 55.456378), 4326), 
                    1731390546, 184, 0.388
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.327041, 55.456681), 4326), 
                    1731390694, 182, 0.6064
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.32785, 55.457047), 4326), 
                    1731390846, 182, 0.4293
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328912, 55.457042), 4326), 
                    1731391015, 192, 0.4006
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328931, 55.456512), 4326), 
                    1731391157, 185, 0.4175
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.327966, 55.456136), 4326), 
                    1731391418, 189, 0.2831
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.327516, 55.455374), 4326), 
                    1731391491, 193, 1.2259
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.327822, 55.455436), 4326), 
                    1731391525, 194, 0.6027
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328428, 55.454869), 4326), 
                    1731391637, 192, 0.6585
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.3281, 55.454609), 4326), 
                    1731391741, 186, 0.3454
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.32824, 55.454549), 4326), 
                    1731391755, 186, 0.7904
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328017, 55.454172), 4326), 
                    1731391804, 200, 0.9471
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328003, 55.453695), 4326), 
                    1731391863, 196, 0.9029
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328201, 55.453241), 4326), 
                    1731391914, 196, 1.0197
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328431, 55.453153), 4326), 
                    1731391949, 196, 0.4999
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328357, 55.452695), 4326), 
                    1731392005, 193, 0.9146
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328676, 55.452359), 4326), 
                    1731392106, 189, 0.4215
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328493, 55.452018), 4326), 
                    1731392253, 198, 0.2765
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328834, 55.451513), 4326), 
                    1731392360, 187, 0.5723
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.328834, 55.45115), 4326), 
                    1731392496, 190, 0.2975
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.330047, 55.450491), 4326), 
                    1731392629, 192, 0.7967
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.329266, 55.450398), 4326), 
                    1731392680, 189, 0.9885
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.330485, 55.450605), 4326), 
                    1731392754, 193, 1.0856
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.331674, 55.450626), 4326), 
                    1731392887, 196, 0.5643
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.33361, 55.451654), 4326), 
                    1731393118, 200, 0.7242
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.333489, 55.451596), 4326), 
                    1731393239, 204, 0.0889
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.333502, 55.451705), 4326), 
                    1731393252, 197, 1.0672
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.333956, 55.451845), 4326), 
                    1731393279, 192, 1.2199
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334263, 55.45209), 4326), 
                    1731393303, 185, 1.4211
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334418, 55.452516), 4326), 
                    1731393338, 192, 1.3936
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334493, 55.452045), 4326), 
                    1731393391, 196, 0.9955
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334233, 55.451951), 4326), 
                    1731393497, 191, 0.1894
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334433, 55.452089), 4326), 
                    1731393545, 190, 0.4139
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334611, 55.451928), 4326), 
                    1731393568, 193, 0.9246
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.33491, 55.451989), 4326), 
                    1731393634, 191, 0.3056
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.3347, 55.451966), 4326), 
                    1731394427, 187, 0.0175
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334951, 55.452028), 4326), 
                    1731394516, 196, 0.2172
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.334992, 55.452168), 4326), 
                    1731394534, 198, 0.8801
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.335952, 55.452278), 4326), 
                    1731394616, 197, 0.7532
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.336656, 55.452249), 4326), 
                    1731394649, 207, 1.3798
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.336698, 55.452114), 4326), 
                    1731394661, 203, 1.2963
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.336948, 55.452262), 4326), 
                    1731394682, 202, 1.0865
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.337192, 55.452109), 4326), 
                    1731394694, 202, 1.9116
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.337567, 55.452209), 4326), 
                    1731394719, 198, 1.0599
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.338478, 55.452061), 4326), 
                    1731394790, 199, 0.8417
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.338814, 55.452079), 4326), 
                    1731394815, 197, 0.854
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.338896, 55.452271), 4326), 
                    1731394910, 195, 0.2319
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.341196, 55.452402), 4326), 
                    1731395037, 210, 1.1534
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.342039, 55.452601), 4326), 
                    1731395075, 203, 1.5267
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.343479, 55.45247), 4326), 
                    1731395147, 202, 1.2773
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.34593, 55.452584), 4326), 
                    1731395257, 192, 1.4129
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.347642, 55.453089), 4326), 
                    1731395350, 200, 1.3115
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.349213, 55.452278), 4326), 
                    1731395436, 198, 1.5578
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.349994, 55.451539), 4326), 
                    1731395507, 203, 1.3508
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.34966, 55.451513), 4326), 
                    1731395538, 199, 0.6972
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.349231, 55.451699), 4326), 
                    1731395563, 207, 1.4001
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.348234, 55.452723), 4326), 
                    1731395653, 201, 1.4467
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.349174, 55.452662), 4326), 
                    1731395696, 197, 1.3901
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.351902, 55.451807), 4326), 
                    1731395848, 198, 1.2931
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.352611, 55.452121), 4326), 
                    1731395894, 192, 1.2396
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.354519, 55.453814), 4326), 
                    1731396058, 194, 1.3623
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.355711, 55.454111), 4326), 
                    1731396146, 194, 0.9329
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.356258, 55.454822), 4326), 
                    1731396213, 183, 1.2965
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.357264, 55.455365), 4326), 
                    1731396313, 178, 0.8775
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.3574, 55.455621), 4326), 
                    1731396370, 190, 0.5644
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.35778, 55.455726), 4326), 
                    1731396459, 191, 0.2999
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358245, 55.455217), 4326), 
                    1731396531, 186, 0.8887
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358305, 55.455092), 4326), 
                    1731396598, 186, 0.215
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358135, 55.455065), 4326), 
                    1731396634, 185, 0.3107
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358266, 55.455139), 4326), 
                    1731397084, 177, 0.0317
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358225, 55.454982), 4326), 
                    1731397641, 182, 0.0329
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.35829, 55.455153), 4326), 
                    1731398245, 195, 0.0395
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.35839, 55.45503), 4326), 
                    1731398258, 187, 1.3456
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358297, 55.45524), 4326), 
                    1731398361, 195, 0.2489
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358207, 55.45514), 4326), 
                    1731398409, 193, 0.2634
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358777, 55.455162), 4326), 
                    1731398514, 191, 0.3441
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358261, 55.455003), 4326), 
                    1731398722, 193, 0.1785
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358207, 55.455153), 4326), 
                    1731399144, 192, 0.0404
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358332, 55.455111), 4326), 
                    1731399280, 182, 0.1025
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358142, 55.455047), 4326), 
                    1731399337, 176, 0.2603
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358298, 55.455186), 4326), 
                    1731399465, 186, 0.162
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358235, 55.455103), 4326), 
                    1731399555, 186, 0.1117
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358411, 55.455096), 4326), 
                    1731399660, 184, 0.1086
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358614, 55.454566), 4326), 
                    1731399715, 184, 1.0965
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.359036, 55.454057), 4326), 
                    1731399772, 183, 1.0975
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.358971, 55.453525), 4326), 
                    1731399815, 181, 1.3795
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.361418, 55.452584), 4326), 
                    1731400006, 158, 0.9838
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.362351, 55.452497), 4326), 
                    1731400078, 154, 0.8294
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.362826, 55.452656), 4326), 
                    1731400133, 162, 0.6497
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.363193, 55.452456), 4326), 
                    1731400165, 164, 1.0042
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.365068, 55.452338), 4326), 
                    1731400251, 164, 1.3832
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.365481, 55.452513), 4326), 
                    1731400277, 162, 1.2538
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.366946, 55.452099), 4326), 
                    1731400358, 161, 1.2743
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.368347, 55.452056), 4326), 
                    1731400441, 163, 1.0664
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.368751, 55.452231), 4326), 
                    1731400468, 162, 1.189
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.371281, 55.452272), 4326), 
                    1731400620, 153, 1.0516
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.371954, 55.45291), 4326), 
                    1731400748, 163, 0.651
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.373767, 55.45303), 4326), 
                    1731400844, 164, 1.199
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.374889, 55.452668), 4326), 
                    1731400910, 161, 1.2343
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.378797, 55.452704), 4326), 
                    1731401113, 156, 1.2143
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.379148, 55.452383), 4326), 
                    1731401159, 157, 0.9135
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.379123, 55.452536), 4326), 
                    1731401173, 160, 1.2379
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.37883, 55.452697), 4326), 
                    1731401201, 162, 0.92
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.378333, 55.452649), 4326), 
                    1731401340, 158, 0.2303
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.378233, 55.452817), 4326), 
                    1731401452, 159, 0.1765
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.378748, 55.453271), 4326), 
                    1731401630, 168, 0.3407
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.381787, 55.452923), 4326), 
                    1731401822, 166, 1.0182
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.384233, 55.452982), 4326), 
                    1731401947, 166, 1.235
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.386392, 55.452563), 4326), 
                    1731402070, 172, 1.1708
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387068, 55.452073), 4326), 
                    1731402175, 168, 0.66
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387238, 55.452178), 4326), 
                    1731402202, 167, 0.5878
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387116, 55.452048), 4326), 
                    1731402303, 198, 0.3419
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387264, 55.452177), 4326), 
                    1731402763, 171, 0.0699
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387066, 55.452075), 4326), 
                    1731403197, 168, 0.0392
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387188, 55.452167), 4326), 
                    1731403384, 165, 0.0716
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.3871, 55.452067), 4326), 
                    1731403570, 163, 0.0674
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.38722, 55.452062), 4326), 
                    1731403583, 162, 0.5921
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.38722, 55.451803), 4326), 
                    1731403625, 173, 0.7383
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387644, 55.451728), 4326), 
                    1731403728, 160, 0.3023
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.387663, 55.45147), 4326), 
                    1731403823, 164, 0.3066
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.38818, 55.451158), 4326), 
                    1731403911, 153, 0.5576
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.388939, 55.451096), 4326), 
                    1731404035, 156, 0.391
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.388871, 55.45096), 4326), 
                    1731404072, 154, 0.4279
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.389201, 55.45051), 4326), 
                    1731404133, 153, 0.8885
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.389779, 55.450165), 4326), 
                    1731404202, 148, 0.7709
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.393507, 55.451028), 4326), 
                    1731404517, 141, 0.8064
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.395111, 55.451054), 4326), 
                    1731405263, 148, 0.1359
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.394865, 55.451157), 4326), 
                    1731405762, 143, 0.0395
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.394968, 55.451421), 4326), 
                    1731405826, 147, 0.4729
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.395647, 55.451455), 4326), 
                    1731405886, 157, 0.7344
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.396333, 55.451777), 4326), 
                    1731405959, 171, 0.7941
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.397221, 55.451833), 4326), 
                    1731406047, 169, 0.6405
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.400848, 55.450341), 4326), 
                    1731406309, 184, 1.0798
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.401123, 55.450336), 4326), 
                    1731406322, 181, 1.3474
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.401166, 55.450574), 4326), 
                    1731406351, 185, 0.9287
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.401525, 55.450944), 4326), 
                    1731406429, 184, 0.6023
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.401186, 55.450276), 4326), 
                    1731406512, 185, 0.9314
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.40191, 55.449986), 4326), 
                    1731406601, 180, 0.6311
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402324, 55.44999), 4326), 
                    1731406644, 181, 0.6075
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402529, 55.450144), 4326), 
                    1731406667, 186, 0.9641
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402242, 55.450369), 4326), 
                    1731406692, 185, 1.2366
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402533, 55.450831), 4326), 
                    1731406752, 185, 0.9092
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402378, 55.450942), 4326), 
                    1731406767, 184, 1.051
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402427, 55.450697), 4326), 
                    1731406798, 187, 0.8884
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402252, 55.450363), 4326), 
                    1731406824, 186, 1.4902
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402632, 55.45021), 4326), 
                    1731406840, 185, 1.8383
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.402461, 55.449917), 4326), 
                    1731406861, 186, 1.635
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.405348, 55.449207), 4326), 
                    1731407012, 176, 1.3158
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.405551, 55.449315), 4326), 
                    1731407025, 177, 1.351
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.406048, 55.450083), 4326), 
                    1731407082, 180, 1.5969
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.40642, 55.450304), 4326), 
                    1731407103, 178, 1.6201
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.408453, 55.450933), 4326), 
                    1731407199, 173, 1.5221
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.410796, 55.451097), 4326), 
                    1731407321, 174, 1.2202
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.412693, 55.451399), 4326), 
                    1731407434, 183, 1.1027
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.413277, 55.451344), 4326), 
                    1731407478, 188, 0.8563
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414605, 55.451526), 4326), 
                    1731407555, 190, 1.1191
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414996, 55.45143), 4326), 
                    1731407576, 185, 1.3022
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.415126, 55.45156), 4326), 
                    1731407589, 184, 1.2783
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.415084, 55.451328), 4326), 
                    1731407614, 185, 1.0374
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414358, 55.451413), 4326), 
                    1731407658, 178, 1.0749
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414633, 55.451461), 4326), 
                    1731407712, 178, 0.3361
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.41452, 55.451738), 4326), 
                    1731407765, 181, 0.5988
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414839, 55.451991), 4326), 
                    1731407800, 191, 1.0286
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414529, 55.452199), 4326), 
                    1731407846, 182, 0.6826
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414552, 55.452381), 4326), 
                    1731407873, 183, 0.7516
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.41469, 55.452303), 4326), 
                    1731407997, 188, 0.1061
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414658, 55.452103), 4326), 
                    1731408011, 187, 1.5958
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414918, 55.452177), 4326), 
                    1731408053, 185, 0.4402
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.414803, 55.452105), 4326), 
                    1731408312, 184, 0.0417
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.415125, 55.451783), 4326), 
                    1731408376, 184, 0.6432
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.415174, 55.451453), 4326), 
                    1731408417, 184, 0.8983
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.415884, 55.451629), 4326), 
                    1731408542, 179, 0.3925
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.416727, 55.45155), 4326), 
                    1731408579, 190, 1.4862
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.417238, 55.451699), 4326), 
                    1731408614, 194, 1.0398
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.419927, 55.451316), 4326), 
                    1731408862, 187, 0.7055
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.420753, 55.451524), 4326), 
                    1731408963, 178, 0.572
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.420232, 55.451308), 4326), 
                    1731409036, 169, 0.569
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.421095, 55.451492), 4326), 
                    1731409140, 178, 0.5647
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.422377, 55.450937), 4326), 
                    1731409250, 172, 0.9262
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.423885, 55.45073), 4326), 
                    1731409839, 170, 0.1661
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.424032, 55.450313), 4326), 
                    1731409894, 171, 0.8598
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.423909, 55.450261), 4326), 
                    1731409990, 167, 0.1079
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.424026, 55.450258), 4326), 
                    1731410046, 168, 0.1319
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.423729, 55.450363), 4326), 
                    1731410149, 166, 0.2147
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.424065, 55.450169), 4326), 
                    1731410233, 162, 0.3633
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.423945, 55.450154), 4326), 
                    1731410340, 163, 0.073
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.423889, 55.450439), 4326), 
                    1731410480, 165, 0.2281
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.424039, 55.450382), 4326), 
                    1731410537, 165, 0.1998
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.424084, 55.449936), 4326), 
                    1731410637, 174, 0.5045
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.424027, 55.449583), 4326), 
                    1731410671, 169, 1.1668
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.423618, 55.449093), 4326), 
                    1731410724, 169, 1.1374
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.423751, 55.448863), 4326), 
                    1731410759, 162, 0.796
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.425555, 55.449135), 4326), 
                    1731410856, 166, 1.2146
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.425905, 55.44904), 4326), 
                    1731410883, 165, 0.909
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.42641, 55.449125), 4326), 
                    1731410910, 160, 1.2416
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.427111, 55.448981), 4326), 
                    1731410943, 167, 1.4392
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.427726, 55.448645), 4326), 
                    1731410987, 168, 1.2241
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.427891, 55.448404), 4326), 
                    1731411006, 166, 1.5151
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.430044, 55.448376), 4326), 
                    1731411112, 159, 1.2832
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.431833, 55.447818), 4326), 
                    1731411250, 155, 0.9334
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.43283, 55.447889), 4326), 
                    1731411339, 149, 0.7156
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434006, 55.447504), 4326), 
                    1731411441, 154, 0.841
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434821, 55.447654), 4326), 
                    1731411489, 148, 1.1314
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.435078, 55.44945), 4326), 
                    1731411644, 161, 1.2954
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.43415, 55.449616), 4326), 
                    1731411691, 161, 1.3057
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.433985, 55.449794), 4326), 
                    1731411719, 169, 0.8556
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.433266, 55.449725), 4326), 
                    1731411756, 171, 1.2433
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.433817, 55.449764), 4326), 
                    1731411784, 165, 1.2638
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.433892, 55.449903), 4326), 
                    1731411796, 164, 1.3507
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434177, 55.449904), 4326), 
                    1731411860, 173, 0.3155
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434202, 55.450014), 4326), 
                    1731412074, 172, 0.0581
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434033, 55.449987), 4326), 
                    1731412176, 172, 0.1085
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434169, 55.450036), 4326), 
                    1731412369, 164, 0.0664
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434057, 55.449991), 4326), 
                    1731412549, 165, 0.0486
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434119, 55.449859), 4326), 
                    1731412981, 165, 0.0352
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434145, 55.449974), 4326), 
                    1731413057, 169, 0.178
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.434282, 55.449853), 4326), 
                    1731413065, 169, 1.9989
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.43451, 55.449935), 4326), 
                    1731413082, 164, 1.0405
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.435679, 55.451609), 4326), 
                    1731413215, 173, 1.5067
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.436597, 55.451503), 4326), 
                    1731413315, 163, 0.5995
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.436921, 55.451873), 4326), 
                    1731413376, 178, 0.7937
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.438009, 55.451958), 4326), 
                    1731413439, 172, 1.1031
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.438324, 55.452127), 4326), 
                    1731413459, 169, 1.3771
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.438616, 55.452101), 4326), 
                    1731413481, 167, 0.8493
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.438643, 55.452254), 4326), 
                    1731413546, 162, 0.2754
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.438863, 55.452328), 4326), 
                    1731413563, 162, 0.9488
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.441493, 55.452326), 4326), 
                    1731413757, 162, 0.8549
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.44226, 55.451903), 4326), 
                    1731413821, 163, 1.0542
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.442741, 55.451915), 4326), 
                    1731413877, 173, 0.5702
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.444948, 55.450426), 4326), 
                    1731414027, 175, 1.442
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.447057, 55.451142), 4326), 
                    1731414157, 182, 1.1935
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.448924, 55.450011), 4326), 
                    1731414276, 174, 1.449
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.450819, 55.449845), 4326), 
                    1731414384, 169, 1.1208
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.451264, 55.450055), 4326), 
                    1731414407, 175, 1.6146
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.452657, 55.45231), 4326), 
                    1731414587, 188, 1.4777
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.453214, 55.452952), 4326), 
                    1731414642, 184, 1.4487
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.453871, 55.452692), 4326), 
                    1731414683, 196, 1.2676
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.457867, 55.452394), 4326), 
                    1731414858, 186, 1.4533
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.458332, 55.452098), 4326), 
                    1731414888, 195, 1.4997
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.45822, 55.451919), 4326), 
                    1731414906, 203, 1.2507
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.458017, 55.452019), 4326), 
                    1731414919, 203, 1.3043
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.458097, 55.451408), 4326), 
                    1731414976, 200, 1.1968
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.45796, 55.451059), 4326), 
                    1731415008, 197, 1.2443
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.458145, 55.450605), 4326), 
                    1731415039, 203, 1.6795
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.458679, 55.450416), 4326), 
                    1731415093, 196, 0.7452
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.460522, 55.450567), 4326), 
                    1731415175, 194, 1.4323
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.464014, 55.45033), 4326), 
                    1731415324, 194, 1.4884
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.466677, 55.449498), 4326), 
                    1731415482, 197, 1.2137
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.468526, 55.448455), 4326), 
                    1731415580, 173, 1.6962
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.469637, 55.448507), 4326), 
                    1731415631, 173, 1.3785
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.469839, 55.448639), 4326), 
                    1731415669, 182, 0.5593
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.469763, 55.44845), 4326), 
                    1731415709, 183, 0.5396
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.469952, 55.44813), 4326), 
                    1731415756, 184, 0.7987
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.469992, 55.448298), 4326), 
                    1731415769, 187, 1.4708
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.470363, 55.448163), 4326), 
                    1731415784, 180, 1.9047
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.470952, 55.447643), 4326), 
                    1731415829, 188, 1.5373
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.47081, 55.447612), 4326), 
                    1731415864, 187, 0.2775
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.471175, 55.447424), 4326), 
                    1731415888, 183, 1.3063
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.472426, 55.447669), 4326), 
                    1731415948, 189, 1.3949
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.47339, 55.447597), 4326), 
                    1731415992, 189, 1.3936
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.47389, 55.44772), 4326), 
                    1731416022, 182, 1.1713
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.474525, 55.448155), 4326), 
                    1731416085, 178, 0.9987
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.475333, 55.448033), 4326), 
                    1731416115, 182, 1.762
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.47602, 55.448285), 4326), 
                    1731416148, 183, 1.564
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.476579, 55.448201), 4326), 
                    1731416168, 186, 1.8314
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.477023, 55.447961), 4326), 
                    1731416233, 177, 0.612
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.477642, 55.447959), 4326), 
                    1731416260, 184, 1.4664
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.477585, 55.448092), 4326), 
                    1731416304, 177, 0.3779
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.477745, 55.448196), 4326), 
                    1731416315, 176, 1.3963
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.483581, 55.444932), 4326), 
                    1731416656, 176, 1.5158
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.484971, 55.444778), 4326), 
                    1731416728, 173, 1.2411
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488593, 55.442937), 4326), 
                    1731416930, 169, 1.5187
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488691, 55.442741), 4326), 
                    1731416945, 167, 1.5167
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488456, 55.44221), 4326), 
                    1731416982, 179, 1.6749
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488481, 55.441948), 4326), 
                    1731416996, 182, 2.0989
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488168, 55.44148), 4326), 
                    1731417027, 172, 1.8264
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.487868, 55.441552), 4326), 
                    1731417219, 170, 0.1076
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.487885, 55.441437), 4326), 
                    1731417414, 157, 0.0929
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.487998, 55.441509), 4326), 
                    1731417446, 157, 0.335
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.4879, 55.441544), 4326), 
                    1731417459, 157, 0.5619
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488376, 55.441456), 4326), 
                    1731417598, 157, 0.2272
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488198, 55.441542), 4326), 
                    1731417662, 156, 0.2312
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.488492, 55.44202), 4326), 
                    1731417702, 164, 1.4211
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.490786, 55.441795), 4326), 
                    1731417829, 174, 1.1591
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.492981, 55.441424), 4326), 
                    1731417974, 158, 1.0027
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.492999, 55.441316), 4326), 
                    1731417984, 156, 1.2168
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.493644, 55.441362), 4326), 
                    1731418036, 162, 0.7972
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.493946, 55.441081), 4326), 
                    1731418085, 164, 0.7472
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.493582, 55.440473), 4326), 
                    1731418149, 158, 1.1195
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.495064, 55.439178), 4326), 
                    1731418314, 156, 1.0405
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.495561, 55.438947), 4326), 
                    1731418343, 157, 1.398
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.496403, 55.438986), 4326), 
                    1731418377, 151, 1.5772
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.496273, 55.438918), 4326), 
                    1731418388, 151, 1.0141
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.496086, 55.438901), 4326), 
                    1731418396, 151, 1.4932
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.497408, 55.43922), 4326), 
                    1731418473, 154, 1.1773
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.498226, 55.439265), 4326), 
                    1731418510, 155, 1.4014
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.498605, 55.439141), 4326), 
                    1731418530, 149, 1.407
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.499142, 55.438439), 4326), 
                    1731418585, 171, 1.5953
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.499397, 55.438946), 4326), 
                    1731418626, 157, 1.4657
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.499812, 55.439051), 4326), 
                    1731418641, 153, 1.9364
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.50042, 55.438725), 4326), 
                    1731418671, 151, 1.7605
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.501232, 55.438679), 4326), 
                    1731418708, 146, 1.3978
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.501774, 55.438195), 4326), 
                    1731418746, 153, 1.6877
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.502964, 55.437556), 4326), 
                    1731418809, 152, 1.6406
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.503344, 55.437569), 4326), 
                    1731418830, 148, 1.1593
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.504719, 55.436854), 4326), 
                    1731418932, 143, 1.1546
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.506222, 55.436592), 4326), 
                    1731419003, 144, 1.3971
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.50672, 55.436307), 4326), 
                    1731419043, 155, 1.1466
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.508656, 55.435843), 4326), 
                    1731419162, 158, 1.1145
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.509345, 55.435775), 4326), 
                    1731419190, 164, 1.5891
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.509611, 55.43592), 4326), 
                    1731419213, 163, 1.0124
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.510159, 55.435676), 4326), 
                    1731419252, 160, 1.1308
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.510229, 55.435463), 4326), 
                    1731419283, 168, 0.8274
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.511144, 55.43565), 4326), 
                    1731419326, 168, 1.4268
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.512789, 55.435364), 4326), 
                    1731419541, 154, 0.5095
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.513153, 55.435591), 4326), 
                    1731419583, 152, 0.813
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.51444, 55.43568), 4326), 
                    1731419651, 164, 1.214
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.516651, 55.435563), 4326), 
                    1731419745, 172, 1.4931
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.517707, 55.435321), 4326), 
                    1731419814, 171, 1.0414
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.518655, 55.435458), 4326), 
                    1731419872, 172, 1.0641
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.520084, 55.435255), 4326), 
                    1731419933, 173, 1.5236
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.522047, 55.43522), 4326), 
                    1731420103, 175, 0.7289
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.522467, 55.435364), 4326), 
                    1731420126, 175, 1.346
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.523284, 55.435358), 4326), 
                    1731420159, 174, 1.5622
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.525625, 55.435207), 4326), 
                    1731420258, 177, 1.5016
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.527321, 55.435381), 4326), 
                    1731420335, 158, 1.4328
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.527166, 55.435464), 4326), 
                    1731420378, 156, 0.3149
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.527773, 55.43556), 4326), 
                    1731420514, 168, 0.3047
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.531746, 55.435652), 4326), 
                    1731420756, 160, 1.037
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.532297, 55.435605), 4326), 
                    1731420791, 162, 1.0055
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.53229, 55.435148), 4326), 
                    1731420826, 160, 1.453
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.532405, 55.435078), 4326), 
                    1731420879, 161, 0.2011
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.533787, 55.435068), 4326), 
                    1731420977, 170, 0.8952
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.535199, 55.434491), 4326), 
                    1731421133, 184, 0.7091
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.535696, 55.434475), 4326), 
                    1731421323, 186, 0.1657
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.535548, 55.434606), 4326), 
                    1731421816, 184, 0.0354
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.5357, 55.43457), 4326), 
                    1731421840, 192, 0.5674
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.535626, 55.434379), 4326), 
                    1731421980, 185, 0.1638
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.535742, 55.434301), 4326), 
                    1731421992, 182, 0.974
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.536456, 55.434842), 4326), 
                    1731422051, 169, 1.2924
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.53779, 55.435029), 4326), 
                    1731422113, 158, 1.4098
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.542273, 55.4333), 4326), 
                    1731422348, 191, 1.4621
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.542732, 55.432911), 4326), 
                    1731422396, 190, 1.0851
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.542062, 55.432495), 4326), 
                    1731422447, 195, 1.2339
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.542297, 55.432002), 4326), 
                    1731422482, 188, 1.6378
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.542346, 55.431494), 4326), 
                    1731422519, 184, 1.5317
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.543806, 55.430802), 4326), 
                    1731422615, 180, 1.2511
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    3, ST_SetSRID(ST_MakePoint(37.544394, 55.430861), 4326), 
                    1731422720, 180, 0.3588
                );
COMMIT;
