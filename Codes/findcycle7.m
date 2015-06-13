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
      for i3 = 1:n
        ci3 = choices(i3);
        matrix3 = [basename,int2str(ci3)];
        P3 = P2*eval(matrix3);
        for i4 = 1:n
          ci4 = choices(i4);
          matrix4 = [basename,int2str(ci4)];
          P4 = P3*eval(matrix4);
          for i5 = 1:n
            ci5 = choices(i5);
            matrix5 = [basename,int2str(ci5)];
            P5 = P4*eval(matrix5);
            for i6 = 1:n
              ci6 = choices(i6);
              matrix6 = [basename,int2str(ci6)];
              P6 = P5*eval(matrix6);
              for i7 = 1:n
                ci7 = choices(i7);
                matrix7 = [basename,int2str(ci7)];
                P7 = P6*eval(matrix7);
                if (P7(1,1) > winner) 
                  winner = P7(1,1);
                end
                if ((P7(1,1) >= winner) && (P7(1,1) >= cutoff))
                  fprintf('%3d, %3d, %3d %3d %3d %3d %3d %s, %s, %s, %s, %s, %s, %s, %f \n', ...
                          ci1, ci2, ci3, ci4, ci5, ci6, ci7, ...
                          an{ci1}, an{ci2}, an{ci3}, an{ci4}, ...
                          an{ci5}, an{ci6}, an{ci7}, P7(1,1));
                end
              end
            end
          end
        end
      end
    end
  end
  
toc(t1);

