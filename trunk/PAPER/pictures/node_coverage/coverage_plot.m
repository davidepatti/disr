%after that the workspace is loaded from file
hold on;
plot(def_node,ideal,'-');
plot(def_node, trenta,'--o');
plot(def_node,cinquanta,':.');
plot(def_node,cento,'-.x');
%plot(def_node,ottanta,':');


xlabel('Node Defect Rate');
ylabel('Node Coverage');
legend('Ideal','30x30','50x50','100x100');