%x: matrisini sıralayıp orta değeri geri dönderir
function [OrtaDeger,siraliVektor] = CekirdekSirala(x)
    n=length(x);
    for i=1:n-1
        a=x(i);        
        for j=i+1:n
            b=x(j);
            if(a>b)                
                x(i)=b;
                x(j)=a;
                ara=b;
                b=a;
                a=ara;
            end
        end
    end
    siraliVektor=x;
    OrtaDeger = x(uint8(length(x)/2));
end