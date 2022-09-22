% ___________________________________________________________________
%                                                                   %
%                         Evaluation Metrics                        %
%                                                                   %
%  Developed in MATLAB R2016a                                       %
%                                                                   %
%  Update :  06/09/2022                                             %                                    
%                                                                   %
%  Author and programmer: Farid AYECHE                              %
%                                                                   %
%         e-Mail: ayeche_farid@yahoo.fr                             %
%                 farid.ayeche@univ-setif.dz                        %
%                                                                   %
%                                                                   %
%   Main paper: Ayeche, Farid & Adel, Alti. (2021). HDG and HDGG:   %
%                an extensible feature extraction descriptor for    %
%                effective face and facial expressions recognition. %
%                Pattern Analysis and Applications.                 %
%                 24. 10.1007/s10044-021-00972-2.                   %
%                                                                   %
%___________________________________________________________________%



function [confMat, Acc, Prec, Recl, Fscore, Specificity] = metrics(label, predc) 

% confusion Matrix
confMat = confusionmat(label, predc);
n =  size(confMat, 1);
 

% tp, fp, fn, tn, 
tp = zeros(1, n);
fp = zeros(1, n);
fn = zeros(1, n);
tn = zeros(1, n);

for i = 1 : n
  tp(i) = confMat(i,i); % tp
  fp(i) = sum(confMat(i, :)) - confMat(i,i); % fp
  fn(i) = sum(confMat(:, i)) - confMat(i,i); % fn
  tn(i) = sum(confMat(:)) - sum(confMat(i,:)) - sum(confMat(:,i)) + confMat(i,i); % tn
end



% TP, FP, FN, TN

TP = sum(tp);
FP = sum(fp);
FN = sum(fn);
TN = sum(tn);




% Acc, Prec, Recl, Fscore 

Acc  = (TP + TN) / (TP + TN +FP +FN);
Prec = TP / (TP + FP);
Recl = TP / (TP + FN);
Fscore = 2 * (Prec * Recl ) / (Prec + Recl);
Specificity = TN / (TN + FP);








