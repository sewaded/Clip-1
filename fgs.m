c=zeros(n,1);
pow=50*(u+k+u*k)*floor(max(max(max(a),max(b)),max(max(real(w(:))),max(imag(w(:)))))/50);
for O1 = 1:n
    for O2 = 1 : 2^k
        c(O1)=c(O1)+exp(a * Phis(:,O1) + b * h(:,O2) + transpose(h(:,O2)) * w * Phis(:,O1)-pow);
    end
end
Phi=c;
% Phin=Phi/power((Phi'*Phi),0.5);
E = real((Phi' * H * Phi)/(Phi' * Phi));

% fgsStochastic #Gate to stochastic gradient descent

% c=zeros(n,1);
% pow=50*(u+k+u*k)*floor(max(max(max(a),max(b)),max(max(real(w(:))),max(imag(w(:)))))/50);
% for O1 = 1:n
%     h = -1 * ones(k,1);
%     for O2 = 1 : 2^k
%         for O3 = 1 : k-1
%             if h(O3)==3
%                 h(O3)=-1;
%                 h(O3+1)=h(O3+1)+2;
%             end
%         end
%         c(O1)=c(O1)+exp(a * Phis(:,O1) + b * h + transpose(h) * w * Phis(:,O1)-pow);
%         h(1) = h(1)+2;
%     end
% %     Phi=Phi+c(O1)*phis(:,O1);
% end
% Phi=c;
% % Phin=Phi/power((Phi'*Phi),0.5);
% E = real((Phi' * H * Phi)/(Phi' * Phi));