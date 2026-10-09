%çekirdek matris ortalamasýný alýr
%cm_db=abs(double(cm)-ort);
%cm_min=min(cm_db(:)); 
function [sat,sut] = alchindusPikselDegeriAl(M,cek,ort)    
    enkucukDeger=255;
    for i=1:cek
       for j=1:cek
           deger=abs(double(M(i,j))-ort);
           if deger<enkucukDeger
              enkucukDeger=deger;
              sat=i;
              sut=j;
           end
       end
    end        
end