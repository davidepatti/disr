% fname: out_matlab/set2_50x50.m
% ../nanoxim -dimx 50 -dimy 50  -disr -cyclelinks 3 -bootstrap center -bootstrap_immunity -bootstrap_timeout 2500 

function [node_coverage, link_coverage, nsegments, avg_seg_length, latency] = set2_50x50(symbol)

data = [
% defective_nodes  node_coverage  link_coverage      nsegments avg_seg_length        latency
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
                0         0.9532       0.950816            883        2.69875           3663
             0.05         0.9484       0.900204            731         3.2435           3839
             0.05         0.9472       0.896735            740            3.2           4510
             0.05         0.9496       0.904898            699        3.39628           4099
             0.05           0.95       0.903469            703        3.37838           4184
             0.05          0.946       0.897755            814        2.90541           3418
             0.05         0.9124       0.866939            764         2.9856           3481
             0.05          0.942       0.898571            706        3.33569           3613
             0.05         0.9396       0.887755            690        3.40435           3854
             0.05         0.9504       0.903469            793        2.99622           3679
             0.05         0.9552       0.914898            653        3.65697           3157
              0.1         0.8944       0.806327            674        3.31751           4236
              0.1         0.8828       0.788367            633        3.48657           4988
              0.1         0.8876       0.803265            666        3.33183           3431
              0.1         0.8888       0.797755            670        3.31642           3459
              0.1         0.8924            0.8            665        3.35489           2826
              0.1         0.8928       0.815102            749        2.97997           2858
              0.1           0.89       0.803878            596        3.73322           3335
              0.1         0.8916       0.803673            629        3.54372           3345
              0.1         0.8948       0.806327            704        3.17756           4983
              0.1          0.898       0.815306            663        3.38612           3768
             0.15         0.8504       0.735306            603         3.5257           4931
             0.15         0.8448       0.733878            619        3.41195           4088
             0.15         0.8396       0.719388            532        3.94549           4142
             0.15         0.8308           0.71            584        3.55651           5340
             0.15         0.7588        0.64449            511        3.71233           4928
             0.15         0.8464       0.733061            633        3.34281           4340
             0.15         0.8196       0.692449            586        3.49659           4343
             0.15         0.7968       0.680612            567        3.51323           4003
             0.15          0.816       0.692245            609        3.34975           4601
             0.15         0.8296       0.706327            517        4.01161           4567
              0.2         0.7688       0.636122            533          3.606           4642
              0.2         0.7568       0.622449            538        3.51673           4578
              0.2          0.758       0.616327            510        3.71569           5079
              0.2         0.7452       0.609796            553         3.3689           5648
              0.2         0.7464       0.599592            501        3.72455           5403
              0.2         0.7136       0.577347            486        3.67078           6091
              0.2         0.7424       0.605306            499        3.71944           4707
              0.2         0.7072       0.578367            525        3.36762           5563
              0.2         0.7612       0.619592            543         3.5046           5762
              0.2         0.7548       0.607755            506        3.72925           5868
             0.25         0.0076     0.00571429              7        2.71429           1629
             0.25         0.6976       0.543061            439        3.97267           9302
             0.25          0.018      0.0132653             16         2.8125           3122
             0.25         0.6276       0.487347            397        3.95214           7023
             0.25         0.6444       0.496122            442         3.6448           5196
             0.25         0.4848       0.375102            311        3.89711           6609
             0.25         0.5972       0.458163            387        3.85788           7000
             0.25         0.6592       0.510408            463         3.5594           5303
             0.25         0.6076       0.467959            391        3.88491           5813
             0.25         0.6684       0.529184            472        3.54025           5583
              0.3         0.2352       0.177959            154        3.81818           6567
              0.3         0.1552       0.115102            101        3.84158           4492
              0.3          0.004     0.00265306              2              5           1418
              0.3         0.5624       0.421429            352        3.99432           6711
              0.3         0.0024     0.00142857              1              6           1023
              0.3         0.4516       0.336939            311        3.63023           6841
              0.3         0.2208       0.165714            133        4.15038           6841
              0.3         0.1088      0.0820408             70        3.88571           4282
              0.3          0.138       0.102857             76        4.53947           4862
              0.3         0.0024     0.00142857              1              6           1425
             0.35         0.1876       0.140612            125          3.752           4901
             0.35         0.3476       0.255918            206        4.21845           5028
             0.35         0.0096     0.00653061              7        3.42857           2994
             0.35         0.0112     0.00857143             11        2.54545           2085
             0.35         0.0368      0.0279592             26        3.53846           2837
             0.35         0.0044     0.00306122              3        3.66667           1903
             0.35          0.142      0.0997959             86        4.12791           6037
             0.35         0.0016    0.000816327              1              4           3516
             0.35         0.0188      0.0120408             10            4.7           2575
             0.35         0.0276      0.0202041             22        3.13636           4094
              0.4         0.0224      0.0153061             18        3.11111           2089
              0.4         0.0256      0.0165306             12        5.33333           1957
              0.4         0.0128     0.00836735              6        5.33333           1483
              0.4         0.0616       0.042449             29        5.31034           4096
              0.4         0.0016    0.000816327              1              4           6015
              0.4         0.0016    0.000816327              1              4           3516
              0.4         0.0444      0.0308163             28        3.96429           2149
              0.4         0.0016    0.000816327              1              4           1016
              0.4         0.0032     0.00204082              2              4           1377
              0.4         0.0076     0.00530612              6        3.16667           3194
             0.45          0.026      0.0173469             13              5           2549
             0.45         0.0016    0.000816327              1              4           3516
             0.45         0.0016    0.000816327              1              4           1015
             0.45          0.004     0.00265306              3        3.33333           1438
             0.45         0.0032     0.00204082              3        2.66667           1483
             0.45         0.0092     0.00673469              7        3.28571           1605
             0.45         0.0024     0.00142857              1              6           1023
             0.45         0.0064     0.00428571              5            3.2           1535
             0.45         0.0024     0.00142857              1              6           3523
             0.45          0.006     0.00428571              6            2.5           1047
              0.5         0.0104     0.00714286              5            5.2           1965
              0.5         0.0128     0.00938776              8              4           2642
              0.5         0.0044     0.00285714              3        3.66667           1389
              0.5         0.0056     0.00387755              3        4.66667           1813
              0.5         0.0084     0.00591837              7              3           1652
              0.5          0.004     0.00265306              3        3.33333           1377
              0.5         0.0048     0.00326531              2              6           1252
              0.5         0.0052     0.00326531              3        4.33333           1544
              0.5         0.0052     0.00346939              4           3.25           1056
              0.5         0.0052     0.00367347              2            6.5           1160
];

rows = size(data, 1);
cols = size(data, 2);

Latency = [];
for i = 1:rows/10,
   ifirst = (i - 1) * 10 + 1;
   ilast  = ifirst + 10 - 1;
   tmp = data(ifirst:ilast, cols-5+5);
   avg = mean(tmp);
   [h sig ci] = ttest(tmp, 0.1);
   ci = (ci(2)-ci(1))/2;
   Latency = [Latency; data(ifirst, 1:cols-5), avg ci];
end

figure(1);
hold on;
title('Impact of Size and Defects on Latency')
plot(Latency(:,1), Latency(:,2)*1.6, symbol);
xlabel('Node Defect Rate')
ylabel('Latency')
