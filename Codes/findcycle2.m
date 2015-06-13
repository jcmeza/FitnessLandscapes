choices = [1,2,3,4,5,6,7,8,9,10,11,13,14];
cutoff  = 1/3;
winner  = 0;

n        = length(choices);
basename = 'M';

t1 = tic;

for i1= 1:n
    ci1 = choices(i1);
    matrix1 = [basename,int2str(ci1)];
    P1 = eval(matrix1);
    for i2= 1:n
        ci2 = choices(i2);
        matrix2 = [basename,int2str(ci2)];
        P2 = P1*eval(matrix2);
        if (P2(1,1) > winner) 
            winner = P2(1,1);
        end
        if ((P2(1,1) >= winner) && (P2(1,1) >= cutoff))
            fprintf('%3d, %3d, %s, %s, %f \n', ci1, ci2, an{ci1}, an{ci2}, P2(1,1));
        end
    end
end
toc(t1);

