%after that the workspace is loaded from file
hold on;
plot(def_node,ideal,'r--');
plot(def_node, trenta,'-+');
plot(def_node, trenta,'--o');
plot(def_node,cinquanta,':*');
plot(def_node,cento,'-.');
%plot(def_node,ottanta,':');


xlabel('Node Defect Rate');
ylabel('Node Coverage');
legend('Ideal','10x10','30x30','50x50','100x100');