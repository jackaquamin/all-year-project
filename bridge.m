clear
clf

x = [50:10:150];
r1 = 100;
r2 = 100;
r3 = 100;
ru = 100;

for i=1:11
    Ru = ru +((x(i)-100)*0.3);
    y(i) = 12*((r2/(r2+r1))-(r3/(r3+Ru)));
    y2(i) = 34.228*((1000/(1000+r1))-(1000/(1000+Ru)));
end

figure(1),plot(x,y,'r',x,y2,'b'),grid on
axis([100 150 0 .5])
title('Linearization of bridge circuit')
xlabel('Ru(ohm)');
ylabel('Vo(V)');