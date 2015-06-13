choices = [1,2,3,4,5,6,7,8,9,10,11,13,14];
cutoff  = 1/3;
winner  = 0;

n        = length(choices);
basename = 'M';

t1 = tic;

for i1= 1:n
    for i2= 1:n
        matrix1 = [basename,int2str(i1)];
        matrix2 = [basename,int2str(i2)];
        P = eval(matrix1)*eval(matrix2);
        if (P(1,1) > winner) 
            winner = P(1,1);
        end
        if ((P(1,1) >= winner) && (P(1,1) >= cutoff))
            i1; i2; an{i1}; an{i2}; P(1,1);
        end
    end
end
toc(t1);

