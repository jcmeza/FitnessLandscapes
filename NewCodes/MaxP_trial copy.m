function [MaxP] = MaxP_trial(adj_list, MMatrixCell)

Vij = adj_list(i,j)
%For each vertex in adj_list: I need to use Vij
for i = 1:16
   %For each adjacent vertex
   for j= 1:4
       %Find max probability for each transition from i to j and for each
        %antibiotic
        for
            %For each probability transition matrix compute maxP over all matrices.
            MaxP = -1
            num_matrices = length(MMatrixCell)
            for k = 1:num_matrices
            Mk = MMatrixCell{k}
            MaxP = Max(MaxP,Mk(i,j))
          
            end 
        
        end
        

   end 
end





