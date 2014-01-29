% fname: out_matlab/set2_10x10.m
% ../nanoxim -dimx 10 -dimy 10  -disr -cyclelinks 3 -gv -bootstrap center -bootstrap_immunity -bootstrap_timeout 100 

function [node_coverage, link_coverage, nsegments, avg_seg_length, latency] = set2_10x10(symbol)

data = [
% defective_nodes  node_coverage  link_coverage      nsegments avg_seg_length        latency
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
                0              1              1             48        2.08333           1268
             0.05           0.94       0.894444             34        2.76471           1296
             0.05           0.94       0.883333             28        3.35714           1304
             0.05           0.97       0.938889             37        2.62162           1290
             0.05           0.97       0.955556             34        2.85294           1337
             0.05           0.92       0.877778             35        2.62857           1313
             0.05           0.85       0.816667             32        2.65625           1302
             0.05           0.99       0.977778             40          2.475           1264
             0.05           0.94       0.883333             35        2.68571           1316
             0.05           0.95       0.922222             40          2.375           1323
             0.05           0.96       0.916667             40            2.4           1276
             0.05           0.97       0.938889             38        2.55263           1224
             0.05           0.94       0.905556             30        3.13333           1235
             0.05           0.95       0.894444             30        3.16667           1308
             0.05           0.91       0.855556             30        3.03333           1318
             0.05           0.91       0.883333             36        2.52778           1310
             0.05           0.94       0.888889             38        2.47368           1281
             0.05            0.9           0.85             30              3           1292
             0.05           0.92           0.85             30        3.06667           1331
             0.05           0.98       0.955556             38        2.57895           1297
             0.05           0.96       0.938889             35        2.74286           1353
              0.1           0.82           0.75             26        3.15385           1456
              0.1           0.92       0.872222             29        3.17241           1266
              0.1           0.71       0.633333             24        2.95833           1305
              0.1           0.91       0.838889             28           3.25           1373
              0.1           0.87       0.811111             28        3.10714           1338
              0.1           0.73           0.65             20           3.65           1348
              0.1           0.86       0.777778             31        2.77419           1243
              0.1           0.84       0.722222             25           3.36           1299
              0.1           0.92       0.855556             25           3.68           1202
              0.1           0.88       0.855556             34        2.58824           1273
              0.1           0.94       0.894444             31        3.03226           1334
              0.1            0.9       0.811111             27        3.33333           1401
              0.1           0.87       0.777778             21        4.14286           1365
              0.1           0.98       0.961111             37        2.64865           1266
              0.1           0.86       0.783333             29        2.96552           1308
              0.1            0.9       0.844444             33        2.72727           1388
              0.1           0.89            0.8             30        2.96667           1371
              0.1           0.88       0.805556             25           3.52           1228
              0.1           0.69       0.594444             20           3.45           1328
              0.1           0.82            0.7             31        2.64516           1418
             0.15           0.86       0.755556             26        3.30769           1308
             0.15           0.72       0.594444             26        2.76923           1281
             0.15           0.72       0.661111             29        2.48276           1469
             0.15           0.75       0.688889             23        3.26087           1217
             0.15           0.85       0.727778             24        3.54167           1390
             0.15            0.5       0.405556             17        2.94118           1300
             0.15           0.77       0.694444             28           2.75           1283
             0.15           0.85       0.755556             33        2.57576           1308
             0.15           0.72       0.633333             27        2.66667           1426
             0.15           0.76       0.644444             24        3.16667           1369
             0.15           0.83       0.738889             28        2.96429           1270
             0.15           0.79       0.711111             26        3.03846           1249
             0.15           0.79       0.666667             26        3.03846           1342
             0.15            0.8       0.694444             26        3.07692           1300
             0.15           0.88       0.805556             32           2.75           1351
             0.15           0.88       0.761111             31        2.83871           1295
             0.15           0.77       0.694444             22            3.5           1200
             0.15           0.77       0.677778             19        4.05263           1297
             0.15           0.69       0.594444             23              3           1382
             0.15           0.86       0.766667             31        2.77419           1233
              0.2           0.73       0.594444             17        4.29412           1183
              0.2            0.6       0.544444             25            2.4           1244
              0.2           0.67       0.572222             19        3.52632           1477
              0.2           0.74       0.633333             22        3.36364           1480
              0.2           0.84       0.755556             29        2.89655           1313
              0.2           0.56       0.455556             14              4           1484
              0.2           0.66       0.566667             23        2.86957           1338
              0.2           0.65           0.55             22        2.95455           1364
              0.2           0.53       0.466667             21        2.52381           1583
              0.2           0.76       0.661111             21        3.61905           1588
              0.2           0.87       0.772222             30            2.9           1338
              0.2            0.8       0.677778             25            3.2           1493
              0.2           0.64       0.544444             16              4           1244
              0.2           0.67       0.577778             20           3.35           1393
              0.2           0.59       0.494444             18        3.27778           1378
              0.2           0.82       0.738889             24        3.41667           1227
              0.2           0.65       0.538889             23        2.82609           1222
              0.2           0.65       0.544444             21        3.09524           1435
              0.2           0.37       0.283333              9        4.11111           1162
              0.2           0.64       0.538889             19        3.36842           1344
             0.25           0.12      0.0888889              5            2.4           1247
             0.25           0.54       0.433333             17        3.17647           1223
             0.25           0.48           0.35             10            4.8           1414
             0.25           0.14       0.105556              3        4.66667           1248
             0.25           0.72       0.611111             20            3.6           1428
             0.25           0.68           0.55             18        3.77778           1399
             0.25           0.24       0.188889              6              4           1270
             0.25           0.73       0.622222             19        3.84211           1392
             0.25           0.65       0.505556             19        3.42105           1260
             0.25           0.69       0.566667             19        3.63158           1368
             0.25           0.64       0.522222             19        3.36842           1336
             0.25           0.21           0.15              5            4.2           1298
             0.25           0.66       0.522222             18        3.66667           1453
             0.25           0.42            0.3             11        3.81818           1323
             0.25           0.73       0.594444             24        3.04167           1402
             0.25           0.16       0.122222              3        5.33333           1148
             0.25           0.76       0.622222             23        3.30435           1380
             0.25           0.47       0.416667             14        3.35714           1423
             0.25           0.63            0.5             21              3           1491
             0.25           0.73       0.588889             23        3.17391           1256
              0.3            0.2       0.155556              5              4           1511
              0.3           0.53       0.427778             18        2.94444           1409
              0.3           0.27       0.216667              7        3.85714           1245
              0.3           0.27            0.2              8          3.375           1312
              0.3           0.39       0.311111             12           3.25           1138
              0.3            0.3       0.227778              7        4.28571           1347
              0.3           0.21       0.177778             10            2.1           1269
              0.3           0.44           0.35              9        4.88889           1555
              0.3           0.28       0.211111              8            3.5           1368
              0.3           0.52       0.411111             17        3.05882           1462
              0.3           0.22       0.177778              8           2.75           1225
              0.3           0.31       0.255556              8          3.875           1392
              0.3           0.42       0.344444             12            3.5           1270
              0.3           0.06      0.0388889              1              6           1023
              0.3           0.36       0.311111             13        2.76923           1233
              0.3           0.48       0.427778             18        2.66667           1290
              0.3           0.49       0.344444              9        5.44444           1227
              0.3           0.33           0.25              9        3.66667           1321
              0.3           0.49       0.416667             15        3.26667           1300
              0.3           0.22       0.166667              6        3.66667           1217
             0.35           0.06      0.0388889              2              3           1024
             0.35           0.13      0.0944444              4           3.25           1143
             0.35           0.06      0.0388889              1              6           1237
             0.35           0.16       0.111111              4              4           1212
             0.35            0.3       0.227778              9        3.33333           1138
             0.35           0.35       0.277778             10            3.5           1284
             0.35           0.59            0.5             17        3.47059           1262
             0.35           0.21       0.161111              6            3.5           1288
             0.35           0.14       0.105556              4            3.5           1121
             0.35           0.32       0.261111             12        2.66667           1385
             0.35           0.47       0.377778             16         2.9375           1327
             0.35           0.14       0.105556              4            3.5           1244
             0.35           0.08      0.0555556              3        2.66667           1140
             0.35           0.39       0.311111             10            3.9           1769
             0.35           0.28       0.205556              7              4           1239
             0.35           0.42       0.338889             10            4.2           1333
             0.35           0.27       0.194444              5            5.4           1449
             0.35           0.37       0.322222             15        2.46667           1308
             0.35           0.59            0.5             18        3.27778           1258
             0.35           0.34       0.244444              5            6.8           1319
              0.4           0.27            0.2              6            4.5           1409
              0.4           0.07      0.0444444              1              7           1139
              0.4           0.32       0.261111             10            3.2           1358
              0.4           0.44       0.333333             11              4           1425
              0.4           0.09      0.0611111              2            4.5           1047
              0.4           0.28       0.227778              8            3.5           1270
              0.4           0.21       0.161111              7              3           1279
              0.4           0.17       0.127778              5            3.4           1252
              0.4           0.28       0.211111              8            3.5           1267
              0.4            0.1      0.0722222              3        3.33333           1178
              0.4           0.37       0.288889              8          4.625           1229
              0.4           0.16       0.127778              6        2.66667           1138
              0.4           0.12      0.0944444              5            2.4           1126
              0.4           0.19       0.138889              6        3.16667           1319
              0.4           0.21       0.161111              7              3           1259
              0.4           0.49       0.377778             16         3.0625           1368
              0.4           0.24       0.194444              7        3.42857           1350
              0.4           0.04      0.0222222              1              4           1015
              0.4           0.21       0.144444              3              7           1246
              0.4           0.19       0.127778              3        6.33333           1362
             0.45           0.04      0.0222222              1              4           1215
             0.45           0.09      0.0611111              3              3           1143
             0.45           0.24       0.155556              4              6           1335
             0.45           0.31       0.233333              6        5.16667           1207
             0.45           0.13            0.1              3        4.33333           1183
             0.45           0.06      0.0388889              2              3           1224
             0.45           0.01              0              1              1              6
             0.45           0.28            0.2              7              4           1197
             0.45           0.06      0.0388889              1              6           1024
             0.45           0.14       0.111111              7              2           1046
             0.45           0.21       0.155556              8          2.625           1435
             0.45            0.1      0.0722222              3        3.33333           1131
             0.45            0.1      0.0722222              1             10           1139
             0.45           0.08      0.0555556              2              4           1024
             0.45           0.06      0.0388889              1              6           1024
             0.45           0.06      0.0388889              2              3           1024
             0.45           0.06      0.0388889              2              3           1314
             0.45           0.06      0.0388889              2              3           1126
             0.45           0.23       0.172222              6        3.83333           1272
             0.45           0.33       0.255556             12           2.75           1281
              0.5           0.33       0.261111              9        3.66667           1229
              0.5           0.08      0.0555556              2              4           1240
              0.5           0.09      0.0666667              3              3           1030
              0.5           0.04      0.0222222              1              4           1116
              0.5           0.04      0.0222222              1              4           1015
              0.5            0.1      0.0722222              3        3.33333           1087
              0.5           0.06      0.0388889              2              3           1024
              0.5           0.07      0.0444444              1              7           1027
              0.5            0.1      0.0722222              3        3.33333           1112
              0.5           0.15       0.116667              5              3           1210
              0.5           0.07      0.0444444              1              7           1160
              0.5           0.04      0.0222222              1              4           1016
              0.5           0.19           0.15              5            3.8           1154
              0.5           0.12      0.0888889              4              3           1100
              0.5           0.12      0.0888889              4              3           1132
              0.5           0.07      0.0444444              1              7           1026
              0.5           0.16       0.116667              3        5.33333           1159
              0.5           0.06      0.0388889              2              3           1024
              0.5           0.04      0.0222222              1              4           1215
              0.5           0.04      0.0222222              1              4           1016
];

rows = size(data, 1);
cols = size(data, 2);

Latency = [];
for i = 1:rows/20,
   ifirst = (i - 1) * 20 + 1;
   ilast  = ifirst + 20 - 1;
   tmp = data(ifirst:ilast, cols-5+5);
   avg = mean(tmp);
   [h sig ci] = ttest(tmp, 0.1);
   ci = (ci(2)-ci(1))/2;
   Latency = [Latency; data(ifirst, 1:cols-5), avg ci];
end

figure(1);
hold on;
title('Impact of Size and Defects on Latency')
plot(Latency(:,1), Latency(:,2), symbol);
xlabel('Node Defect Rate')
ylabel('Latency')