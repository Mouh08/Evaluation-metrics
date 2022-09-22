clc
clear all
close all



% example 1 
label = [ 1 2 3 1 2 3 1 1 2 3 2 1 1 2 3];
predc = [ 1 2 3 1 2 3 1 1 1 2 2 1 2 1 3];


% Example 2
label      = [1 1 1 1 1   2 2 2 2 2   3 3 3 3 3     4 4 4 4 4   5 5 5 5 5     6 6 6 6 6    7 7 7 7 7];
predc      = [1 1 1 -1 1   2 2 2 2 2   3 3 3 6 3     4 4 4 4 4   5 5 1 5 5     6 6 6 6 6    7 7 7 7 3];



[confMat, Acc, Prec, Recl, Fscore, Specificity] = metrics(label, predc) 