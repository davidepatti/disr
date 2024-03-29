% fname: out_matlab/set1_10x10.m
% ../nanoxim -dimx 10 -dimy 10  -disr -cyclelinks 3 -gv -bootstrap center -bootstrap_immunity -bootstrap_timeout 100 

function [node_coverage, link_coverage, nsegments, avg_seg_length] = set1_10x10(symbol)

data = [
% defective_nodes  node_coverage  link_coverage      nsegments avg_seg_length
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
                0              1              1             48        2.08333
             0.05           0.99       0.983333             40          2.475
             0.05           0.96       0.911111             30            3.2
             0.05           0.97       0.955556             35        2.77143
             0.05           0.96       0.927778             35        2.74286
             0.05           0.97       0.961111             40          2.425
             0.05           0.99       0.977778             38        2.60526
             0.05           0.96       0.911111             37        2.59459
             0.05           0.92       0.866667             39        2.35897
             0.05           0.95            0.9             33        2.87879
             0.05           0.94       0.933333             45        2.08889
             0.05           0.94       0.872222             36        2.61111
             0.05           0.96       0.922222             36        2.66667
             0.05           0.97       0.938889             43        2.25581
             0.05           0.96       0.916667             32              3
             0.05           0.92       0.888889             32          2.875
             0.05           0.97       0.938889             32        3.03125
             0.05           0.97       0.938889             34        2.85294
             0.05           0.93       0.866667             28        3.32143
             0.05           0.96       0.916667             28        3.42857
             0.05           0.99       0.988889             40          2.475
              0.1           0.93       0.888889             33        2.81818
              0.1           0.81       0.755556             33        2.45455
              0.1           0.86       0.772222             24        3.58333
              0.1           0.79            0.7             29        2.72414
              0.1           0.92           0.85             32          2.875
              0.1           0.91       0.833333             25           3.64
              0.1           0.95       0.905556             27        3.51852
              0.1           0.91       0.844444             32        2.84375
              0.1           0.92           0.85             26        3.53846
              0.1           0.82       0.722222             29        2.82759
              0.1           0.85       0.761111             23        3.69565
              0.1           0.93       0.861111             29         3.2069
              0.1           0.87       0.755556             32        2.71875
              0.1           0.88       0.811111             30        2.93333
              0.1           0.65       0.566667             25            2.6
              0.1           0.83       0.777778             32        2.59375
              0.1           0.94            0.9             30        3.13333
              0.1           0.96       0.916667             32              3
              0.1           0.93       0.888889             27        3.44444
              0.1           0.83       0.666667             23         3.6087
             0.15           0.89       0.805556             24        3.70833
             0.15           0.73           0.65             28        2.60714
             0.15           0.82       0.688889             15        5.46667
             0.15            0.8       0.677778             25            3.2
             0.15           0.76       0.633333             25           3.04
             0.15           0.83           0.75             35        2.37143
             0.15           0.89       0.805556             20           4.45
             0.15           0.81       0.722222             30            2.7
             0.15           0.77       0.661111             21        3.66667
             0.15           0.74           0.65             23        3.21739
             0.15            0.8            0.7             32            2.5
             0.15           0.81       0.688889             29         2.7931
             0.15           0.67            0.6             20           3.35
             0.15           0.86       0.766667             32         2.6875
             0.15           0.72       0.622222             22        3.27273
             0.15           0.75       0.655556             28        2.67857
             0.15           0.83       0.727778             20           4.15
             0.15           0.77       0.672222             24        3.20833
             0.15           0.84       0.722222             24            3.5
             0.15           0.84       0.744444             25           3.36
              0.2           0.56       0.427778             18        3.11111
              0.2           0.58       0.516667             22        2.63636
              0.2           0.81       0.722222             32        2.53125
              0.2           0.72       0.594444             19        3.78947
              0.2            0.8       0.733333             33        2.42424
              0.2           0.54           0.45             12            4.5
              0.2            0.6       0.488889             17        3.52941
              0.2           0.79       0.677778             24        3.29167
              0.2           0.08      0.0555556              2              4
              0.2           0.82       0.744444             26        3.15385
              0.2           0.54       0.461111             13        4.15385
              0.2           0.71       0.616667             27        2.62963
              0.2           0.34       0.294444             11        3.09091
              0.2           0.86       0.761111             26        3.30769
              0.2           0.65           0.55             18        3.61111
              0.2           0.72       0.572222             20            3.6
              0.2           0.43       0.355556             13        3.30769
              0.2            0.8            0.7             27        2.96296
              0.2           0.47       0.388889             11        4.27273
              0.2           0.65       0.544444             21        3.09524
             0.25            0.4       0.311111             11        3.63636
             0.25           0.54            0.5             22        2.45455
             0.25           0.41       0.338889             14        2.92857
             0.25           0.29       0.216667              8          3.625
             0.25           0.66       0.572222             24           2.75
             0.25           0.77       0.672222             29        2.65517
             0.25           0.25       0.211111              5              5
             0.25            0.6       0.516667             15              4
             0.25           0.42       0.344444             12            3.5
             0.25           0.62            0.5             17        3.64706
             0.25           0.83       0.705556             24        3.45833
             0.25           0.64            0.5             15        4.26667
             0.25           0.72       0.583333             23        3.13043
             0.25           0.72       0.577778             20            3.6
             0.25           0.72       0.588889             17        4.23529
             0.25           0.49       0.405556             13        3.76923
             0.25           0.67       0.538889             18        3.72222
             0.25           0.79           0.65             23        3.43478
             0.25           0.51       0.405556             14        3.64286
             0.25           0.61       0.488889             16         3.8125
              0.3           0.18       0.144444              8           2.25
              0.3           0.35       0.277778             10            3.5
              0.3           0.45       0.361111             10            4.5
              0.3           0.37       0.288889             11        3.36364
              0.3           0.28       0.211111              8            3.5
              0.3           0.57       0.438889             13        4.38462
              0.3           0.44       0.388889             19        2.31579
              0.3           0.39       0.322222             12           3.25
              0.3           0.36       0.288889             10            3.6
              0.3           0.17       0.133333              8          2.125
              0.3           0.28       0.216667              8            3.5
              0.3           0.43       0.361111              9        4.77778
              0.3           0.26       0.172222              4            6.5
              0.3           0.16       0.122222              6        2.66667
              0.3            0.6           0.45             16           3.75
              0.3            0.4       0.316667              9        4.44444
              0.3           0.52           0.45             15        3.46667
              0.3           0.52       0.416667             17        3.05882
              0.3           0.31           0.25              7        4.42857
              0.3           0.01              0              1              1
             0.35           0.47       0.383333             13        3.61538
             0.35           0.09      0.0611111              2            4.5
             0.35           0.43       0.327778             10            4.3
             0.35           0.42       0.344444             15            2.8
             0.35           0.22       0.177778              7        3.14286
             0.35           0.19       0.133333              6        3.16667
             0.35           0.43       0.338889             11        3.90909
             0.35           0.13            0.1              5            2.6
             0.35           0.29       0.233333              9        3.22222
             0.35           0.34       0.272222             12        2.83333
             0.35           0.24       0.194444              8              3
             0.35           0.38       0.283333              8           4.75
             0.35            0.1      0.0722222              3        3.33333
             0.35           0.08      0.0555556              3        2.66667
             0.35           0.24       0.194444              8              3
             0.35           0.15       0.111111              4           3.75
             0.35           0.06      0.0388889              2              3
             0.35           0.24       0.183333              4              6
             0.35           0.27       0.216667              7        3.85714
             0.35           0.01              0              1              1
              0.4           0.15            0.1              3              5
              0.4           0.12      0.0888889              3              4
              0.4           0.06      0.0388889              1              6
              0.4           0.29       0.222222             10            2.9
              0.4           0.56       0.444444             16            3.5
              0.4           0.16       0.116667              6        2.66667
              0.4           0.29       0.222222             10            2.9
              0.4            0.1      0.0722222              2              5
              0.4           0.07      0.0444444              1              7
              0.4           0.25            0.2              8          3.125
              0.4           0.12      0.0888889              4              3
              0.4           0.43       0.327778             11        3.90909
              0.4           0.37       0.255556              7        5.28571
              0.4           0.16       0.122222              3        5.33333
              0.4           0.29       0.211111              5            5.8
              0.4           0.18       0.138889              4            4.5
              0.4           0.08      0.0555556              1              8
              0.4           0.47       0.338889             12        3.91667
              0.4            0.1      0.0722222              3        3.33333
              0.4           0.07      0.0444444              1              7
             0.45           0.06      0.0388889              2              3
             0.45           0.15       0.116667              4           3.75
             0.45           0.23       0.183333              9        2.55556
             0.45           0.22       0.161111              5            4.4
             0.45           0.09      0.0611111              2            4.5
             0.45           0.04      0.0222222              1              4
             0.45            0.3       0.238889             11        2.72727
             0.45           0.04      0.0222222              1              4
             0.45           0.23       0.183333              7        3.28571
             0.45           0.26       0.211111              7        3.71429
             0.45           0.17       0.127778              3        5.66667
             0.45           0.06      0.0388889              1              6
             0.45           0.08      0.0555556              2              4
             0.45           0.07      0.0444444              1              7
             0.45           0.18       0.133333              6              3
             0.45           0.09      0.0611111              2            4.5
             0.45           0.04      0.0222222              1              4
             0.45           0.21       0.172222              7              3
             0.45           0.06      0.0388889              2              3
             0.45           0.07      0.0444444              1              7
              0.5           0.08      0.0444444              1              8
              0.5           0.07      0.0444444              1              7
              0.5            0.1      0.0722222              3        3.33333
              0.5           0.18           0.15              6              3
              0.5           0.12      0.0888889              3              4
              0.5           0.31       0.222222              8          3.875
              0.5           0.07      0.0444444              1              7
              0.5           0.09      0.0611111              2            4.5
              0.5           0.01              0              1              1
              0.5           0.18       0.122222              4            4.5
              0.5            0.1      0.0722222              3        3.33333
              0.5           0.09      0.0611111              2            4.5
              0.5           0.04      0.0222222              1              4
              0.5           0.19       0.144444              6        3.16667
              0.5           0.09      0.0611111              2            4.5
              0.5           0.15       0.111111              4           3.75
              0.5           0.14       0.105556              4            3.5
              0.5           0.15       0.105556              4           3.75
              0.5           0.09      0.0611111              1              9
              0.5           0.24       0.172222              5            4.8
];

rows = size(data, 1);
cols = size(data, 2);

node_coverage = [];
for i = 1:rows/20,
   ifirst = (i - 1) * 20 + 1;
   ilast  = ifirst + 20 - 1;
   tmp = data(ifirst:ilast, cols-4+1);
   avg = mean(tmp);
   [h sig ci] = ttest(tmp, 0.1);
   ci = (ci(2)-ci(1))/2;
   node_coverage = [node_coverage; data(ifirst, 1:cols-4), avg ci];
end

figure(1);
hold on;

title('Node Coverage')
x = [0:0.05:0.5]
y = 1-x
plot(x,y,'--r')
plot(node_coverage(:,1), node_coverage(:,2), symbol);
ylim([0 1])
xlabel('Node Defect Rate')
ylabel('node_coverage')

legend('10x10','Ideal')

