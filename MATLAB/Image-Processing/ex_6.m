clear
clf
x = [0:0.1:10];
no = 0.1*randn(size(x,1),size(x,2));
y = 2*x+no;
y1 = y+4;

figure(1),subplot(221),plot(x,y,'g',x,y1,'r'),grid on
title('Graph of Pressure and Voltage - Offset drift')
xlabel('Pressure (N)');
ylabel('Volt')

y2 = 1.2*y;
figure(1),subplot(222),plot(x,y,'g',x,y2,'r'),grid on
title('Graph of Pressure and Voltage - Sensitivity drift')
xlabel('Pressure (N)');
ylabel('Volt')

y3 = 1.2*y+4;
figure(1),subplot(223),plot(x,y,'g',x,y3,'r'),grid on
title('Graph of Pressure and Voltage - Offset&Sensitivity drift')
xlabel('Pressure (N)');
ylabel('Volt')

no = 2*randn(size(x,1),size(x,2));
y4 = 1.2*y+4+no;
figure(1),subplot(224),plot(x,y,'g',x,y4,'r'),grid on
title('Graph of Pressure and Voltage - Noisy')
xlabel('Pressure (N)');
ylabel('Volt')

%%%%%%%%%%%%Correction
offset = mean(y1) - mean(y)
ny1 = y1-offset;

figure(2),subplot(221),plot(x,y,'g',x,y1,'r',x,ny1,'ob'),grid on
title('Graph of Pressure and Voltage - Offset drift')
xlabel('Pressure (N)');
ylabel('Volt')

range1 = max(y2)-min(y2);
range2 = max(y)-min(y);
ny2 = ((y-min(y)*range1/range2)+min(y2));

figure(2),subplot(222),plot(x,y,'g',x,y2,'r',x,ny2,'ob'),grid on
title('Graph of Pressure and Voltage - Sensitivity drift Correct')
xlabel('Pressure (N)');
ylabel('Volt')

offset = y3(1)-y(1)
ny3 = y3-offset;
figure(2),subplot(223),plot(x,y,'g',x,y3,'r',x,ny3,'ob'),grid on
title('Graph of Pressure and Voltage - Offset&Sensitivity drift Correct')
xlabel('Pressure (N)');
ylabel('Volt')

range1 = max(ny3)-min(ny3);
range2 = max(y)-min(y);
ny32 = ((y-min(y)*range1/range2)+min(ny3));
figure(2),subplot(223),plot(x,y,'g',x,y3,'r',x,ny3,'ob',x,ny32,'+'),grid on
title('Graph of Pressure and Voltage - Offset&Sensitivity drift Correct')
xlabel('Pressure (N)');
ylabel('Volt')











