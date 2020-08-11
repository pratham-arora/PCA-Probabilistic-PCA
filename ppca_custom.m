function [W, sigma] = ppca_custom(S, m)

    [d, ~] = size(S);   
    W = ones(d, m);
    sigma = 1;
    epsilon = 0.0001;
    I=eye(m);
    
    %%
    %Implementation of PPCA algorithm using Expectation Maximization
    %Reference:Research Paper on Probabilistic Principal Component Analysis
    %by Tipping and Bishop.
    
    while (true)
        M = W'*W + sigma^2 * I;
        W_dash = S * W * inv( sigma^2 * I + inv(M)*W'*S*W);
        sigma_dash = sqrt(1/d * trace(S - S *W *inv(M) *W_dash'));
        if(abs(sigma_dash - sigma) < epsilon && max(max(abs(W_dash - W))) < epsilon)
          W = W_dash;
          sigma = sigma_dash;
          break;
        end
        W = W_dash;
        sigma = sigma_dash;
    end
     
end
