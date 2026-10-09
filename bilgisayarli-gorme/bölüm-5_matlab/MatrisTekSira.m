function yeni = MatrisTekSira(cek,x)
    a=zeros(1,cek*cek);
    index=0;
    for sat=1:cek
       for sut=1:cek
           index=index+1;
           a(index)=x(sat,sut);
       end
    end
    yeni=a;
end