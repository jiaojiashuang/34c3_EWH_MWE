function P = norm_legendre_functions(theta, Lmax)% fully normalized associated Legendre functions of the first kind% input:  theta angle of polar distance in radians%         Lmax  maximum degree of spherical harmonic coefficients% output:   P   Legendre functions %% References% Torge, W. and M�ller, J. (2012): Geodesy, 4th Ed., de Gruyter, Berlin/Boston% Print ISBN 978-3-11-020718-7P=zeros(Lmax+1,Lmax+1) ;t=cos(theta);y=sin(theta);P(1,1) = 1.0 ;P(2,1) = sqrt(3.0)*t;P(2,2) = sqrt(3.0)*y;P(3,1) = 0.5*sqrt(5.0)*(3.0*t^2-1);P(3,2) = sqrt(15.0)*y*t;P(3,3) = 0.5*sqrt(15.0)*y^2;for LP1 = 4:Lmax+1  % index  L=LP1-1 ;         % degree l  for MP1 =1:LP1-2  % index      M=MP1-1 ;     % order m      P(LP1,MP1)=sqrt((2*L+1)*(2*L-1)/((L+M)*(L-M)))*t*P(LP1-1,MP1)-...          sqrt((2*L+1)*(L+M-1)*(L-M-1)/((2*L-3)*(L+M)*(L-M))) * ...                   P(LP1-2,MP1);   end  P(LP1,LP1-1) = sqrt(2*L+1)*t*P(LP1-1,LP1-1);  P(LP1,LP1) = sqrt((2*L+1)/(2*L)) * y * P(LP1-1,LP1-1);end