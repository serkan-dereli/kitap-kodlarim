%
function [enKucukUzaklik,deger] = alchindusDegerAl(x,y,min,cek)
    for i=1:cek
       for j=1:cek
           if x(i,j)<=min
               enKucukUzaklik=x(i,j);
               deger=y(i,j);
           end            
       end
    end
end