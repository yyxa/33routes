BEGIN;
INSERT INTO routes (
                    route_id, user_id, name, url, description,
                    length, duration, tags, 
                    category, created_at, status,
                    images
                ) VALUES (
                    1, 2, 'Moscow, Kremlin and Red square 1-8-2016 (Московский Кремль, Красная Площадь)', 
                    'moscow-kremlin-and-red-square-1-8-2016', 'Описание пока не добавлено',
                    8349, 10816, ARRAY['park']::tag_type[],
                    'walking', 1741996736, 'approved', ARRAY['kremlin_1.png', 'kremlin_2.png']
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619685, 55.759452), 4326), 
                    1470040798, 156, 0.0
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619267, 55.759324), 4326), 
                    1470040806, 156, 3.7219
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619044, 55.759326), 4326), 
                    1470040813, 158, 2.0065
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618979, 55.759273), 4326), 
                    1470040819, 159, 1.2074
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618911, 55.759246), 4326), 
                    1470040826, 160, 0.7526
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618906, 55.759178), 4326), 
                    1470040832, 160, 1.2652
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618958, 55.759123), 4326), 
                    1470040837, 189, 5.8465
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61888, 55.758956), 4326), 
                    1470040861, 175, 0.9685
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618706, 55.75888), 4326), 
                    1470041057, 139, 0.201
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618562, 55.758782), 4326), 
                    1470041110, 147, 0.3065
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618304, 55.758704), 4326), 
                    1470041141, 149, 0.5958
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618025, 55.75862), 4326), 
                    1470041143, 213, 33.3529
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617845, 55.758553), 4326), 
                    1470041180, 206, 0.4062
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617628, 55.758427), 4326), 
                    1470041193, 191, 1.912
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61739, 55.758215), 4326), 
                    1470041198, 202, 5.9948
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617267, 55.758146), 4326), 
                    1470041200, 154, 24.6074
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617231, 55.758114), 4326), 
                    1470041257, 135, 0.3414
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61714, 55.758049), 4326), 
                    1470041259, 161, 13.79
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617055, 55.758032), 4326), 
                    1470041260, 170, 10.6234
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616951, 55.757977), 4326), 
                    1470041262, 175, 5.1172
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616836, 55.757922), 4326), 
                    1470041264, 182, 5.8774
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616732, 55.757868), 4326), 
                    1470041269, 178, 1.9432
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616666, 55.757816), 4326), 
                    1470041292, 220, 1.852
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616617, 55.757768), 4326), 
                    1470041293, 217, 6.8474
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616562, 55.75772), 4326), 
                    1470041295, 204, 7.2341
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616512, 55.757656), 4326), 
                    1470041297, 183, 11.1963
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616338, 55.757652), 4326), 
                    1470041302, 171, 3.2418
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616215, 55.757623), 4326), 
                    1470041307, 165, 2.0555
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616099, 55.757611), 4326), 
                    1470041312, 159, 1.9022
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616063, 55.757599), 4326), 
                    1470041315, 149, 3.4457
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616049, 55.757579), 4326), 
                    1470041316, 154, 5.5419
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616006, 55.757539), 4326), 
                    1470041332, 159, 0.4508
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615969, 55.757518), 4326), 
                    1470041347, 139, 1.3512
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615904, 55.757477), 4326), 
                    1470041348, 147, 10.066
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615868, 55.757432), 4326), 
                    1470041349, 190, 43.3487
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615795, 55.757396), 4326), 
                    1470041350, 190, 6.0734
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615745, 55.757363), 4326), 
                    1470041352, 183, 4.2501
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.6156, 55.75731), 4326), 
                    1470041354, 172, 7.7143
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615546, 55.757244), 4326), 
                    1470041364, 155, 1.8822
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615376, 55.757221), 4326), 
                    1470041369, 150, 2.4057
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615306, 55.757181), 4326), 
                    1470041374, 143, 1.8758
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615177, 55.757157), 4326), 
                    1470041375, 153, 13.1252
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615083, 55.757155), 4326), 
                    1470041378, 153, 1.9619
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615031, 55.75714), 4326), 
                    1470041379, 153, 3.6562
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614945, 55.757157), 4326), 
                    1470041381, 157, 3.4831
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614863, 55.757196), 4326), 
                    1470041390, 163, 1.0008
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614786, 55.757189), 4326), 
                    1470041406, 164, 0.3114
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614691, 55.757179), 4326), 
                    1470041480, 164, 0.0817
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614409, 55.755238), 4326), 
                    1470042051, 142, 0.3812
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614055, 55.755241), 4326), 
                    1470042052, 141, 22.1758
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614021, 55.755149), 4326), 
                    1470042062, 137, 1.1188
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614026, 55.755054), 4326), 
                    1470042069, 134, 1.5694
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613948, 55.754975), 4326), 
                    1470042079, 136, 1.0246
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613878, 55.754889), 4326), 
                    1470042089, 135, 1.0566
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613868, 55.754799), 4326), 
                    1470042104, 132, 0.6978
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613741, 55.754731), 4326), 
                    1470042137, 135, 0.3446
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61366, 55.754622), 4326), 
                    1470042161, 133, 0.5537
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613578, 55.754541), 4326), 
                    1470042195, 130, 0.3174
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613504, 55.754461), 4326), 
                    1470042207, 128, 0.8522
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613417, 55.754378), 4326), 
                    1470042232, 131, 0.4451
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613445, 55.754289), 4326), 
                    1470042268, 130, 0.2806
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613547, 55.754208), 4326), 
                    1470042277, 133, 1.271
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613648, 55.754125), 4326), 
                    1470042286, 134, 1.2478
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613799, 55.754061), 4326), 
                    1470042295, 131, 1.3559
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613883, 55.75397), 4326), 
                    1470042306, 125, 1.1713
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613988, 55.753893), 4326), 
                    1470042313, 123, 1.568
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614148, 55.75391), 4326), 
                    1470042322, 125, 1.1537
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614316, 55.753927), 4326), 
                    1470042331, 129, 1.2673
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614426, 55.753857), 4326), 
                    1470042363, 124, 0.3603
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614485, 55.753758), 4326), 
                    1470042385, 121, 0.5451
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614466, 55.753663), 4326), 
                    1470042396, 117, 1.0325
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61446, 55.753568), 4326), 
                    1470042417, 117, 0.5033
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614424, 55.753479), 4326), 
                    1470042430, 122, 0.8703
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61438, 55.753377), 4326), 
                    1470042439, 128, 1.4581
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614312, 55.753266), 4326), 
                    1470042447, 124, 1.7068
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614229, 55.753174), 4326), 
                    1470042456, 127, 1.3176
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614126, 55.753096), 4326), 
                    1470042480, 125, 0.4579
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614052, 55.753001), 4326), 
                    1470042487, 125, 1.6477
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613996, 55.752914), 4326), 
                    1470042492, 123, 2.0963
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613924, 55.752805), 4326), 
                    1470042499, 121, 1.8692
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613869, 55.752707), 4326), 
                    1470042507, 124, 1.4769
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613812, 55.752606), 4326), 
                    1470042515, 128, 1.5555
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613758, 55.752512), 4326), 
                    1470042525, 130, 1.1166
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613751, 55.752417), 4326), 
                    1470042551, 129, 0.4085
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613869, 55.752332), 4326), 
                    1470042595, 125, 0.2874
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613683, 55.75232), 4326), 
                    1470042637, 114, 0.3826
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613543, 55.752274), 4326), 
                    1470042681, 134, 0.5097
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613466, 55.752181), 4326), 
                    1470042703, 125, 0.6605
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613316, 55.752136), 4326), 
                    1470042716, 124, 0.8218
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613147, 55.75213), 4326), 
                    1470042747, 125, 0.3433
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612968, 55.752125), 4326), 
                    1470042755, 127, 1.424
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612806, 55.752117), 4326), 
                    1470042763, 125, 1.2964
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612655, 55.75206), 4326), 
                    1470042775, 129, 1.0051
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61263, 55.751956), 4326), 
                    1470042784, 129, 1.2966
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612592, 55.751865), 4326), 
                    1470042792, 128, 1.3053
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612517, 55.75178), 4326), 
                    1470042803, 126, 0.9764
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612484, 55.751679), 4326), 
                    1470042811, 126, 1.4274
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61243, 55.751585), 4326), 
                    1470042819, 126, 1.3731
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612454, 55.751489), 4326), 
                    1470042831, 129, 0.9325
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612412, 55.751399), 4326), 
                    1470042838, 126, 1.539
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612275, 55.751341), 4326), 
                    1470042852, 125, 0.7696
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612387, 55.751475), 4326), 
                    1470042929, 126, 0.215
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612577, 55.75165), 4326), 
                    1470042955, 127, 0.8774
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612707, 55.751868), 4326), 
                    1470043009, 128, 0.474
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612697, 55.752014), 4326), 
                    1470043087, 130, 0.2094
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.612908, 55.752091), 4326), 
                    1470043117, 130, 0.5249
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613154, 55.752076), 4326), 
                    1470043156, 131, 0.3977
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613324, 55.752116), 4326), 
                    1470043191, 132, 0.3302
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613515, 55.752175), 4326), 
                    1470043222, 133, 0.4404
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613685, 55.752274), 4326), 
                    1470043263, 134, 0.374
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.613941, 55.75237), 4326), 
                    1470043316, 135, 0.3638
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614153, 55.752381), 4326), 
                    1470043364, 136, 0.2785
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614474, 55.752333), 4326), 
                    1470043474, 138, 0.1899
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.614912, 55.752229), 4326), 
                    1470043604, 141, 0.2297
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615603, 55.752153), 4326), 
                    1470043757, 144, 0.2886
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616109, 55.752105), 4326), 
                    1470043888, 146, 0.2459
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616767, 55.752048), 4326), 
                    1470044042, 149, 0.2712
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617323, 55.752029), 4326), 
                    1470044166, 151, 0.2818
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617728, 55.751906), 4326), 
                    1470044272, 154, 0.2724
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617856, 55.751774), 4326), 
                    1470044326, 153, 0.3099
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617963, 55.751637), 4326), 
                    1470044366, 152, 0.4163
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618063, 55.751493), 4326), 
                    1470044418, 152, 0.3309
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618114, 55.75141), 4326), 
                    1470044420, 180, 14.827
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617961, 55.751355), 4326), 
                    1470044598, 146, 0.2014
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617793, 55.751304), 4326), 
                    1470044600, 201, 28.1411
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617541, 55.751303), 4326), 
                    1470044602, 173, 16.0678
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617739, 55.751267), 4326), 
                    1470044604, 185, 8.8537
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617504, 55.751193), 4326), 
                    1470044606, 156, 16.7703
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617325, 55.751276), 4326), 
                    1470044608, 154, 7.3256
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617208, 55.75118), 4326), 
                    1470044609, 146, 15.217
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61708, 55.751141), 4326), 
                    1470044610, 164, 20.1735
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616939, 55.751121), 4326), 
                    1470044612, 176, 7.53
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616859, 55.751103), 4326), 
                    1470044613, 170, 8.0666
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61668, 55.751056), 4326), 
                    1470044614, 163, 14.2053
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616725, 55.750967), 4326), 
                    1470044616, 170, 6.2223
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616868, 55.750953), 4326), 
                    1470044619, 182, 5.0167
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617068, 55.750985), 4326), 
                    1470044620, 184, 13.1647
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616802, 55.750925), 4326), 
                    1470044621, 175, 20.065
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616895, 55.750814), 4326), 
                    1470044622, 172, 13.9718
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61708, 55.750831), 4326), 
                    1470044623, 175, 12.1081
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617223, 55.750804), 4326), 
                    1470044625, 197, 11.9697
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617297, 55.750752), 4326), 
                    1470044626, 182, 16.7296
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617351, 55.750723), 4326), 
                    1470044628, 161, 10.7566
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617521, 55.750713), 4326), 
                    1470044665, 161, 0.2891
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617476, 55.750669), 4326), 
                    1470044672, 161, 0.8064
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617386, 55.750655), 4326), 
                    1470045393, 161, 0.0081
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617184, 55.750543), 4326), 
                    1470045515, 161, 0.1455
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617192, 55.750306), 4326), 
                    1470045661, 161, 0.1805
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61745, 55.750344), 4326), 
                    1470045779, 161, 0.1414
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617548, 55.750007), 4326), 
                    1470045989, 162, 0.1808
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617412, 55.750119), 4326), 
                    1470045990, 148, 20.58
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617541, 55.750376), 4326), 
                    1470046001, 148, 2.7
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617743, 55.750422), 4326), 
                    1470046015, 149, 0.975
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617426, 55.750398), 4326), 
                    1470046024, 149, 2.2243
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617559, 55.750176), 4326), 
                    1470046031, 149, 3.7218
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617666, 55.750052), 4326), 
                    1470046044, 150, 1.18
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617937, 55.750098), 4326), 
                    1470046052, 150, 2.2146
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618216, 55.750191), 4326), 
                    1470046059, 150, 2.8993
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618209, 55.750455), 4326), 
                    1470046063, 151, 7.3397
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618354, 55.750492), 4326), 
                    1470046066, 151, 3.3218
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618542, 55.750708), 4326), 
                    1470046069, 151, 8.915
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618592, 55.750951), 4326), 
                    1470046073, 151, 6.8003
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618903, 55.750952), 4326), 
                    1470046140, 152, 0.2909
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619156, 55.751021), 4326), 
                    1470046204, 153, 0.2753
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619554, 55.751261), 4326), 
                    1470046317, 155, 0.3234
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619655, 55.751375), 4326), 
                    1470046381, 156, 0.2219
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619901, 55.751481), 4326), 
                    1470046435, 157, 0.3594
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620073, 55.751608), 4326), 
                    1470046483, 158, 0.3703
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620262, 55.75168), 4326), 
                    1470046528, 158, 0.3178
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620457, 55.751843), 4326), 
                    1470046585, 159, 0.3837
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620544, 55.75192), 4326), 
                    1470046630, 160, 0.226
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620725, 55.751994), 4326), 
                    1470046662, 160, 0.4378
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620888, 55.752126), 4326), 
                    1470046703, 161, 0.4363
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620937, 55.752244), 4326), 
                    1470046726, 161, 0.586
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621173, 55.752301), 4326), 
                    1470046735, 164, 1.8186
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621358, 55.752502), 4326), 
                    1470046747, 169, 2.1265
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621535, 55.75262), 4326), 
                    1470046761, 173, 1.2679
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621763, 55.752754), 4326), 
                    1470046771, 177, 2.0908
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621977, 55.752869), 4326), 
                    1470046777, 178, 3.1006
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622205, 55.752721), 4326), 
                    1470046781, 180, 5.4534
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62199, 55.753031), 4326), 
                    1470046795, 178, 2.6455
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621964, 55.753152), 4326), 
                    1470046802, 177, 1.9395
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621985, 55.753307), 4326), 
                    1470046812, 176, 1.7314
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622175, 55.753232), 4326), 
                    1470046815, 179, 4.9643
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622329, 55.753094), 4326), 
                    1470046819, 184, 4.6558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622478, 55.752938), 4326), 
                    1470046823, 188, 5.0616
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622646, 55.75281), 4326), 
                    1470046828, 193, 3.6327
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622814, 55.752754), 4326), 
                    1470046836, 193, 1.5273
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622248, 55.752711), 4326), 
                    1470046886, 177, 0.7832
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622013, 55.752681), 4326), 
                    1470046889, 161, 7.3286
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622499, 55.752642), 4326), 
                    1470046891, 168, 15.7537
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622306, 55.752655), 4326), 
                    1470046892, 160, 14.5585
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62205, 55.752629), 4326), 
                    1470046895, 154, 5.783
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622195, 55.753031), 4326), 
                    1470046945, 167, 0.9537
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621677, 55.752835), 4326), 
                    1470046947, 107, 36.1749
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621635, 55.752741), 4326), 
                    1470046949, 129, 12.2491
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621763, 55.752669), 4326), 
                    1470046959, 140, 1.5788
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621897, 55.752725), 4326), 
                    1470046980, 140, 0.4974
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621861, 55.752822), 4326), 
                    1470046988, 144, 1.4653
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621781, 55.752905), 4326), 
                    1470046996, 144, 1.3124
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621759, 55.753005), 4326), 
                    1470047004, 140, 1.4871
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621689, 55.753087), 4326), 
                    1470047010, 138, 1.7186
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621619, 55.753172), 4326), 
                    1470047019, 138, 1.1575
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621879, 55.753378), 4326), 
                    1470047036, 150, 1.7971
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621771, 55.753304), 4326), 
                    1470047037, 156, 12.2221
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621581, 55.753257), 4326), 
                    1470047057, 135, 1.2346
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621186, 55.753723), 4326), 
                    1470047114, 138, 1.0089
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621862, 55.753505), 4326), 
                    1470047121, 140, 6.9733
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621871, 55.753595), 4326), 
                    1470047134, 145, 0.8483
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621549, 55.75375), 4326), 
                    1470047140, 145, 4.4194
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620931, 55.753856), 4326), 
                    1470047147, 147, 5.7847
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620904, 55.754023), 4326), 
                    1470047153, 149, 3.1255
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620942, 55.754195), 4326), 
                    1470047160, 150, 2.7536
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620828, 55.753956), 4326), 
                    1470047166, 152, 4.597
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620833, 55.754064), 4326), 
                    1470047180, 155, 0.8844
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620687, 55.754227), 4326), 
                    1470047195, 156, 1.3555
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621566, 55.754567), 4326), 
                    1470047251, 157, 1.192
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621133, 55.754512), 4326), 
                    1470047257, 158, 4.6318
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62057, 55.754439), 4326), 
                    1470047266, 158, 4.0169
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622125, 55.754017), 4326), 
                    1470047276, 159, 10.803
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622247, 55.754192), 4326), 
                    1470047283, 159, 2.9862
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622022, 55.754352), 4326), 
                    1470047289, 159, 3.7814
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621807, 55.754539), 4326), 
                    1470047296, 159, 3.538
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621562, 55.754724), 4326), 
                    1470047302, 159, 4.276
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621342, 55.754832), 4326), 
                    1470047315, 161, 1.4094
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62153, 55.754641), 4326), 
                    1470047322, 161, 3.4688
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622135, 55.754154), 4326), 
                    1470047328, 161, 11.0123
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62102, 55.754922), 4326), 
                    1470047712, 164, 0.2872
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620952, 55.755019), 4326), 
                    1470047733, 158, 0.6217
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620965, 55.755145), 4326), 
                    1470047744, 162, 1.3266
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621279, 55.75489), 4326), 
                    1470047823, 159, 0.4377
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621373, 55.754747), 4326), 
                    1470047952, 161, 0.1321
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621244, 55.754835), 4326), 
                    1470048015, 161, 0.2014
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621579, 55.755144), 4326), 
                    1470048115, 161, 0.4025
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620942, 55.754942), 4326), 
                    1470048123, 159, 5.7245
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620924, 55.755037), 4326), 
                    1470048158, 165, 0.3486
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620819, 55.755109), 4326), 
                    1470048163, 162, 2.1565
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620782, 55.754991), 4326), 
                    1470048173, 150, 1.7931
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620914, 55.754833), 4326), 
                    1470048177, 135, 6.1333
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620753, 55.754922), 4326), 
                    1470048178, 140, 14.981
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620732, 55.754828), 4326), 
                    1470048206, 144, 0.4024
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620884, 55.75478), 4326), 
                    1470048216, 130, 1.7747
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620852, 55.754875), 4326), 
                    1470048239, 143, 0.7335
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621188, 55.755221), 4326), 
                    1470048258, 167, 2.6307
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62123, 55.755347), 4326), 
                    1470048259, 166, 14.2899
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621189, 55.755217), 4326), 
                    1470048260, 167, 14.7152
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621094, 55.755107), 4326), 
                    1470048271, 171, 1.2887
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.6211, 55.754854), 4326), 
                    1470048274, 168, 9.4314
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620911, 55.754546), 4326), 
                    1470048291, 167, 2.1321
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621032, 55.754651), 4326), 
                    1470048304, 167, 1.0704
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621325, 55.754991), 4326), 
                    1470048326, 166, 1.9099
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621229, 55.755089), 4326), 
                    1470048365, 165, 0.3205
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621325, 55.755013), 4326), 
                    1470048372, 165, 1.4815
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621166, 55.755002), 4326), 
                    1470048385, 165, 0.7712
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621308, 55.755077), 4326), 
                    1470048391, 165, 2.0313
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621481, 55.754895), 4326), 
                    1470048404, 164, 1.7656
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621319, 55.755017), 4326), 
                    1470048417, 164, 1.3028
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621518, 55.754977), 4326), 
                    1470048612, 182, 0.1121
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621377, 55.75478), 4326), 
                    1470048650, 179, 0.6239
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62184, 55.754669), 4326), 
                    1470048656, 178, 5.2512
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621717, 55.75474), 4326), 
                    1470048665, 178, 1.2275
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62158, 55.754869), 4326), 
                    1470048669, 173, 4.3535
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621309, 55.754986), 4326), 
                    1470048675, 171, 3.581
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621275, 55.755079), 4326), 
                    1470048695, 167, 0.5516
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621323, 55.754985), 4326), 
                    1470048714, 166, 0.5759
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621343, 55.755068), 4326), 
                    1470048755, 75, 2.2481
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621371, 55.755226), 4326), 
                    1470048763, 150, 9.6313
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621247, 55.755162), 4326), 
                    1470048775, 154, 0.9386
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620911, 55.755081), 4326), 
                    1470048801, 170, 1.0736
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621335, 55.754629), 4326), 
                    1470048831, 169, 1.8946
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621332, 55.754809), 4326), 
                    1470048838, 166, 2.8834
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621616, 55.754679), 4326), 
                    1470048844, 165, 3.8209
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621403, 55.754765), 4326), 
                    1470048851, 165, 2.3441
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62148, 55.754682), 4326), 
                    1470048898, 164, 0.2223
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621251, 55.754384), 4326), 
                    1470048905, 164, 5.1574
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621806, 55.754358), 4326), 
                    1470048911, 164, 5.8081
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621525, 55.754573), 4326), 
                    1470048918, 164, 4.2395
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622084, 55.754178), 4326), 
                    1470048924, 164, 9.3581
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620954, 55.754324), 4326), 
                    1470048937, 164, 5.5807
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621211, 55.754423), 4326), 
                    1470048944, 164, 2.7841
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621249, 55.754727), 4326), 
                    1470048950, 164, 5.6478
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621545, 55.754501), 4326), 
                    1470048957, 164, 4.4597
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621709, 55.7544), 4326), 
                    1470048963, 164, 2.5355
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621609, 55.754542), 4326), 
                    1470048970, 164, 2.4263
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620671, 55.754152), 4326), 
                    1470049304, 164, 0.2185
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620817, 55.754216), 4326), 
                    1470049323, 168, 0.6431
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620949, 55.75427), 4326), 
                    1470049326, 165, 3.5477
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621094, 55.754311), 4326), 
                    1470049336, 155, 1.4252
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621087, 55.754401), 4326), 
                    1470049340, 154, 2.5167
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621143, 55.7545), 4326), 
                    1470049344, 153, 2.8989
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621221, 55.754599), 4326), 
                    1470049348, 148, 3.2596
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621374, 55.754668), 4326), 
                    1470049356, 165, 2.6206
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621568, 55.754666), 4326), 
                    1470049378, 168, 0.5685
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621602, 55.754767), 4326), 
                    1470049395, 167, 0.6749
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62175, 55.754824), 4326), 
                    1470049399, 167, 2.8055
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621909, 55.754885), 4326), 
                    1470049403, 167, 3.0103
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622032, 55.754951), 4326), 
                    1470049408, 159, 2.6615
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622112, 55.755047), 4326), 
                    1470049418, 145, 1.8303
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622035, 55.75495), 4326), 
                    1470049432, 147, 0.8558
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622092, 55.755038), 4326), 
                    1470049456, 148, 0.436
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622152, 55.755129), 4326), 
                    1470049461, 151, 2.2404
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622025, 55.755191), 4326), 
                    1470049537, 149, 0.1409
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621919, 55.755268), 4326), 
                    1470049549, 148, 0.9064
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621757, 55.755298), 4326), 
                    1470049561, 156, 1.1114
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621619, 55.755358), 4326), 
                    1470049601, 148, 0.3383
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621454, 55.755389), 4326), 
                    1470049612, 148, 0.9895
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621374, 55.755473), 4326), 
                    1470049623, 146, 0.9804
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621216, 55.755511), 4326), 
                    1470049633, 151, 1.1857
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621073, 55.755565), 4326), 
                    1470049643, 154, 1.1186
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620928, 55.755609), 4326), 
                    1470049653, 152, 1.05
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620824, 55.755695), 4326), 
                    1470049662, 151, 1.29
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620675, 55.755759), 4326), 
                    1470049670, 148, 1.5133
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620503, 55.755764), 4326), 
                    1470049675, 143, 2.376
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62044, 55.755863), 4326), 
                    1470049726, 153, 0.3017
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620559, 55.755986), 4326), 
                    1470049760, 160, 0.5022
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620597, 55.756077), 4326), 
                    1470049794, 171, 0.4451
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620764, 55.75609), 4326), 
                    1470049820, 174, 0.4218
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620903, 55.756191), 4326), 
                    1470049827, 172, 2.0493
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621068, 55.756274), 4326), 
                    1470049844, 166, 0.8878
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621219, 55.756316), 4326), 
                    1470049870, 170, 0.4336
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621345, 55.756378), 4326), 
                    1470049889, 177, 0.663
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621484, 55.756455), 4326), 
                    1470049895, 174, 2.0946
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621556, 55.756537), 4326), 
                    1470049898, 172, 3.455
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621728, 55.75658), 4326), 
                    1470049903, 165, 2.74
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621891, 55.756583), 4326), 
                    1470049913, 165, 1.0204
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621984, 55.75667), 4326), 
                    1470049917, 162, 2.9203
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622103, 55.756739), 4326), 
                    1470049924, 161, 1.534
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62224, 55.75668), 4326), 
                    1470049934, 159, 1.0978
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622418, 55.756674), 4326), 
                    1470049940, 154, 2.0378
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622621, 55.756678), 4326), 
                    1470049945, 151, 2.6118
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622744, 55.756614), 4326), 
                    1470049952, 150, 1.5042
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622869, 55.756544), 4326), 
                    1470049963, 153, 1.0395
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.623039, 55.756518), 4326), 
                    1470049969, 153, 1.8371
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.623144, 55.756447), 4326), 
                    1470049977, 149, 1.3778
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622982, 55.756452), 4326), 
                    1470050025, 142, 0.2569
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622845, 55.756512), 4326), 
                    1470050030, 141, 2.1817
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622711, 55.756584), 4326), 
                    1470050041, 148, 1.2311
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622598, 55.756651), 4326), 
                    1470050058, 160, 0.9291
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.622524, 55.756746), 4326), 
                    1470050065, 162, 1.6723
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621723, 55.756534), 4326), 
                    1470050104, 161, 1.4202
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621434, 55.756329), 4326), 
                    1470050110, 161, 4.8497
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621591, 55.756548), 4326), 
                    1470050112, 156, 13.435
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621516, 55.756634), 4326), 
                    1470050114, 173, 10.0308
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621684, 55.756594), 4326), 
                    1470050115, 176, 11.8018
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621495, 55.756654), 4326), 
                    1470050116, 174, 13.7245
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621515, 55.756502), 4326), 
                    1470050119, 179, 5.89
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621352, 55.756627), 4326), 
                    1470050122, 172, 6.2023
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621554, 55.756532), 4326), 
                    1470050124, 178, 8.7655
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621563, 55.756439), 4326), 
                    1470050126, 172, 5.9845
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621843, 55.756263), 4326), 
                    1470050127, 170, 26.3428
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621656, 55.756231), 4326), 
                    1470050128, 151, 22.5958
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621194, 55.756425), 4326), 
                    1470050129, 145, 36.565
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621055, 55.756483), 4326), 
                    1470050130, 145, 10.8276
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621351, 55.756424), 4326), 
                    1470050131, 152, 20.8582
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621592, 55.75641), 4326), 
                    1470050132, 164, 19.3343
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621429, 55.756455), 4326), 
                    1470050137, 164, 2.2721
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62119, 55.756458), 4326), 
                    1470050139, 175, 9.2837
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621139, 55.756582), 4326), 
                    1470050142, 182, 5.263
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621222, 55.756418), 4326), 
                    1470050143, 173, 20.9886
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62106, 55.756433), 4326), 
                    1470050147, 168, 2.8562
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.6209, 55.756418), 4326), 
                    1470050155, 168, 1.2687
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620725, 55.756433), 4326), 
                    1470050159, 175, 3.2757
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620822, 55.756357), 4326), 
                    1470050161, 160, 9.1276
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620728, 55.756444), 4326), 
                    1470050164, 168, 4.621
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620821, 55.756337), 4326), 
                    1470050166, 168, 6.6223
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62065, 55.756385), 4326), 
                    1470050170, 175, 3.4638
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620745, 55.756235), 4326), 
                    1470050172, 169, 9.3479
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620599, 55.756309), 4326), 
                    1470050176, 175, 3.4202
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620476, 55.756409), 4326), 
                    1470050177, 170, 14.4179
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620609, 55.756315), 4326), 
                    1470050180, 174, 4.6488
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620774, 55.756143), 4326), 
                    1470050181, 174, 21.7342
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620861, 55.756017), 4326), 
                    1470050185, 167, 4.1453
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620805, 55.75612), 4326), 
                    1470050186, 166, 12.0188
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620986, 55.75608), 4326), 
                    1470050188, 156, 7.8748
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620727, 55.756113), 4326), 
                    1470050190, 157, 8.3231
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620858, 55.756012), 4326), 
                    1470050191, 162, 14.7755
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62071, 55.756074), 4326), 
                    1470050192, 160, 11.7169
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620816, 55.755945), 4326), 
                    1470050193, 154, 16.904
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621824, 55.756377), 4326), 
                    1470050226, 158, 2.4069
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620777, 55.755992), 4326), 
                    1470050233, 161, 11.1861
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62033, 55.755806), 4326), 
                    1470050239, 161, 5.7977
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621245, 55.756232), 4326), 
                    1470050246, 162, 10.6161
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62074, 55.755982), 4326), 
                    1470050259, 162, 3.2376
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620339, 55.755779), 4326), 
                    1470050265, 162, 5.6251
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62006, 55.755638), 4326), 
                    1470050272, 162, 3.3521
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62038, 55.755837), 4326), 
                    1470050284, 163, 2.487
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620639, 55.756005), 4326), 
                    1470050291, 163, 3.533
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.621044, 55.756096), 4326), 
                    1470050310, 163, 1.4362
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.620733, 55.75593), 4326), 
                    1470050317, 163, 3.8317
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619554, 55.755506), 4326), 
                    1470050322, 149, 17.752
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61986, 55.755486), 4326), 
                    1470050323, 170, 28.5054
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619437, 55.755378), 4326), 
                    1470050324, 159, 31.077
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619463, 55.755284), 4326), 
                    1470050328, 169, 3.6392
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619178, 55.754914), 4326), 
                    1470050361, 166, 1.3606
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619689, 55.755389), 4326), 
                    1470050368, 166, 8.8209
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.62075, 55.756039), 4326), 
                    1470050375, 165, 14.02
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619675, 55.755441), 4326), 
                    1470050381, 165, 15.7641
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619085, 55.755106), 4326), 
                    1470050388, 165, 7.4923
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619337, 55.754929), 4326), 
                    1470050437, 164, 0.5148
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619085, 55.755098), 4326), 
                    1470050443, 164, 4.0886
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61932, 55.754941), 4326), 
                    1470050449, 164, 3.8043
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618893, 55.755104), 4326), 
                    1470050462, 164, 2.4835
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618648, 55.755235), 4326), 
                    1470050469, 164, 3.021
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618493, 55.755366), 4326), 
                    1470050475, 164, 2.9167
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618273, 55.755507), 4326), 
                    1470050547, 164, 0.2898
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617769, 55.755806), 4326), 
                    1470050655, 170, 0.4278
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617448, 55.755891), 4326), 
                    1470050736, 174, 0.2794
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616966, 55.755823), 4326), 
                    1470050813, 178, 0.4075
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616836, 55.756066), 4326), 
                    1470050876, 182, 0.4513
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616485, 55.756387), 4326), 
                    1470050930, 185, 0.778
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616295, 55.756585), 4326), 
                    1470050962, 186, 0.7839
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616059, 55.756667), 4326), 
                    1470051025, 190, 0.2807
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615703, 55.756748), 4326), 
                    1470051070, 192, 0.5368
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615482, 55.756943), 4326), 
                    1470051118, 195, 0.5385
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615412, 55.757276), 4326), 
                    1470051142, 196, 1.5547
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615661, 55.757452), 4326), 
                    1470051168, 198, 0.9634
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.615808, 55.757516), 4326), 
                    1470051181, 198, 0.8967
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.61598, 55.757615), 4326), 
                    1470051196, 199, 1.0277
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616161, 55.757692), 4326), 
                    1470051212, 200, 0.8891
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616433, 55.757839), 4326), 
                    1470051237, 201, 0.9453
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616618, 55.757958), 4326), 
                    1470051256, 203, 0.9271
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.616901, 55.758098), 4326), 
                    1470051283, 204, 0.8748
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617143, 55.75817), 4326), 
                    1470051310, 205, 0.6368
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617645, 55.758366), 4326), 
                    1470051351, 208, 0.9341
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617791, 55.758423), 4326), 
                    1470051363, 208, 0.9279
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.617921, 55.758473), 4326), 
                    1470051373, 209, 0.9871
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618128, 55.758585), 4326), 
                    1470051395, 210, 0.8185
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618454, 55.758641), 4326), 
                    1470051414, 211, 1.1237
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618736, 55.758791), 4326), 
                    1470051440, 213, 0.9354
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.618823, 55.75882), 4326), 
                    1470051451, 209, 0.653
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619114, 55.758968), 4326), 
                    1470051490, 198, 0.6949
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619298, 55.759095), 4326), 
                    1470051526, 187, 0.5827
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619454, 55.759191), 4326), 
                    1470051558, 178, 0.5425
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619525, 55.759275), 4326), 
                    1470051580, 171, 0.5529
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619895, 55.759174), 4326), 
                    1470051592, 168, 2.1617
                );
INSERT INTO route_points (
                    route_id, coordinate, time_offset, elevation, speed
                ) VALUES (
                    1, ST_SetSRID(ST_MakePoint(37.619835, 55.759297), 4326), 
                    1470051614, 162, 0.7073
                );
COMMIT;
