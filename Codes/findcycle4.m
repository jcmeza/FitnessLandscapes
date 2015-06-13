choices = [1,2,3,4,5,6,7,8,9,10,11,13,14];
cutoff  = 1/3;
winner  = 0;

n        = length(choices);
basename = 'M';

t1 = tic;

  for i1= 1:n
      ci1 = choices(i1);
        for i2= 1:n
            ci2 = choices(i2);
            for i3 = 1:n
                ci3 = choices(i3);
                for i4 = 1:n
                    ci4 = choices(i4);
                    matrix1 = [basename,int2str(ci1)];
                    matrix2 = [basename,int2str(ci2)];
                    matrix3 = [basename,int2str(ci3)];
                    matrix4 = [basename,int2str(ci4)];
                    P = eval(matrix1)*eval(matrix2)*eval(matrix3)*eval(matrix4);
                    if (P(1,1) > winner) 
                        winner = P(1,1);
                    end
                    if ((P(1,1) >= winner) && (P(1,1) >= cutoff))
                        fprintf('%3d, %3d, %3d %3d %s %s, %s, %s %f \n', ...
                            ci1, ci2, ci3, ci4, an{ci1}, an{ci2}, an{ci3}, an{ci4}, P(1,1));
                    end
                end
            end
        end
    end
toc(t1);

