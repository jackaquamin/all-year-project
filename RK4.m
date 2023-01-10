clear
clf

h= 0.001;
t =[0:h:3];

for i=1:(size(t,2)-1)
a1(1)=1;
a2(1)=2;
a3(1)=3;
t(1)=0;
t(i+1)= t(i)+h;

f=@(t,a1,a2,a3) ((pi/sqrt(2))*a1*a2 + (pi/sqrt(2))*a2*a3);
g=@(t,a1,a2,a3) (-1*(pi/sqrt(2))*a1*a1 + ((2*pi)/sqrt(2))*a1*a3);
n=@(t,a1,a2,a3) (-1*((3*pi)/sqrt(2))*a1*a2);

k11= h*f(t(i),a1(i),a2(i),a3(i));
k21= h*g(t(i),a1(i),a2(i),a3(i));
k31= h*n(t(i),a1(i),a2(i),a3(i));

k12= h*f(t(i)+0.5*h,a1(i)+(k11*h)/2,a2(i)+(k21*h)/2,a3(i)+(k31*h)/2);
k22= h*g(t(i)+0.5*h,a1(i)+(k11*h)/2,a2(i)+(k21*h)/2,a3(i)+(k31*h)/2);
k32= h*n(t(i)+0.5*h,a1(i)+(k11*h)/2,a2(i)+(k21*h)/2,a3(i)+(k31*h)/2);

k13= h*f(t(i)+0.5*h,a1(i)+(k12*h)/2,a2(i)+(k22*h)/2,a3(i)+(k32*h)/2);
k23= h*g(t(i)+0.5*h,a1(i)+(k12*h)/2,a2(i)+(k22*h)/2,a3(i)+(k32*h)/2);
k33= h*n(t(i)+0.5*h,a1(i)+(k12*h)/2,a2(i)+(k22*h)/2,a3(i)+(k32*h)/2);

k14 = h*f(t(i)+h,a1(i)+(k13*h),a2(i)+(k23*h),a3(i)+(k33*h));
k24 = h*g(t(i)+h,a1(i)+(k13*h),a2(i)+(k23*h),a3(i)+(k33*h));
k34 = h*n(t(i)+h,a1(i)+(k13*h),a2(i)+(k23*h),a3(i)+(k33*h));

a1(i+1)=a1(i)+(k11+2*k12+2*k13+k14)/6;
a2(i+1)=a2(i)+(k21+2*k22+2*k23+k24)/6;
a3(i+1)=a3(i)+(k31+2*k32+2*k33+k34)/6;

phi1= sqrt(2)*sin(pi/2);
phi2= sqrt(2)*sin(pi);
phi3= sqrt(2)*sin(3*pi/2);

u(i+1)= (a1(i+1)*phi1)+(a2(i+1)*phi2)+(a3(i+1)*phi3);
end

figure(1); plot(t,a1,'b',t,a2,'r',t,a3,'black',t,u,'g');
grid on;
xlabel('t');
ylabel('a1(t),a2(t),a3(t)&u(t)');