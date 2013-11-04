plot(coverage,dieci,'-+')
xlabel('Node Defect Rate')
ylabel('Latency')
hold on
plot(coverage,trenta,'--o')
plot(coverage,cinquanta,':*')
plot(coverage,cento,'-.x')

legend('100x100','50x50','30x30','10x10')