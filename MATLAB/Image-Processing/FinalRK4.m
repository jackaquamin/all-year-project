clear


 f = @(t,a1) (0);
 g = @(t,a2) (-3*a2);
 n = @(t,a3) (-8*a3);
 
 t(1) = 0;
 a1(1) = 1;
 a2(1) = 2;
 a3(1) = 3;
 
 h = 0.01; 
 final = 3 ;
 
 % RK4 loop
 for i = 1:ceil(final/h)
     
     t(i+1) = t(i)+h;
     
     % K1
     k1a1 = h*f(t(i),a1(i));
     k1a2 = h*g(t(i),a2(i));
     k1a3 = h*n(t(i),a3(i));
     %K2
     k2a1 = h*f(t(i)+0.5.*h,  a1(i)+0.5.*h.*k1a1) ;
     k2a2 = h*g(t(i)+0.5.*h,  a1(i)+0.5.*h.*k1a1) ;
     k2a3 = h*n(t(i)+0.5.*h,  a1(i)+0.5.*k1a1)    ;
     %K3
     k3a1 = h*f(t(i)+0.5.*h,   a2(i)+0.5.*h.*k2a2) ;
     k3a2 = h*g(t(i)+0.5.*h,   a2(i)+0.5.*h.*k2a2) ;
     k3a3 = h*n(t(i)+0.5.*h,   a2(i)+0.5.*k2a2)    ;
     %K4
     k4a1 = h*f(t(i)+h,        a3(i)+h.*k3a3)   ;
     k4a2 = h*g(t(i)+h,        a3(i)+h.*k3a3)   ;
     k4a3 = h*n(t(i)+h,        a3(i)+k3a3)      ;
     
     a1(i+1) = a1(i)+(k1a1+2.*k2a1+2.*k3a1+k4a1)/6;
     a2(i+1) = a2(i)+(k1a2+2.*k2a2+2.*k3a2+k4a2)/6;
     a3(i+1) = a3(i)+(k1a3+2.*k2a3+2.*k3a3+k4a3)/6;
     
 end
 
 
 o1 = sqrt(2/pi)*sin(pi/2);
 o2 = sqrt(2/pi)*sin(pi);
 o3 = sqrt(2/pi)*sin(3*pi/2);

 l1=t;
 l2=2*sqrt(3)/3*sin(sqrt(3)*t);
 l3=2*sqrt(8)/4*sin(sqrt(8)*t);
 u = l1*o1+l2*o2+l3*o3;
 p1 = t;
 p2 = 2*cos(sqrt(3)*t);
 p3 = 6*cos(sqrt(8)*t);
 
 figure(1),p = plot(t,a1,'c',t,a2,'r',t,a3,'b',t,u,'g');
 xlabel('t'),ylabel('1st a1(t),1st a2(t),1st a3(t),u(t)')
 p(1).LineWidth = 1.5 ;
 p(2).LineWidth = 1.5 ;
 p(3).LineWidth = 1.5 ;
 p(4).LineWidth = 1.5 ;
 legend('1st a1(t)','1st a2(t)','1st a3(t)','u(t)')
 axis([0 3 -7 8]),grid on ;
 figure(2),k = plot(t,p1,'c',t,p2,'r',t,p3,'b',t,u,'g')
  xlabel('t'),ylabel('a1(t),a2(t),a3(t),u(t)')
 k(1).LineWidth = 1.5 ;
 k(2).LineWidth = 1.5 ;
 k(3).LineWidth = 1.5 ;
 k(4).LineWidth = 1.5 ;
 legend('a1(t)','a2(t)','a3(t)','u(t)')
 axis([0 3 -7 8]),grid on ;