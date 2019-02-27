# Clip-1
'initial' is the root script . Do plz include gds gd4 fgs before running the code.
select which matrix(H4 H5 H8 ... H70) u'd like to use as a model for H2O by commenting off certain lines of code
(Oh this code is really really exclusive to myself....but effective)
the 'initial' function would generate a random initial point for further searching 
it will use 'gds' for Gradient-Descent iteration
and 'gds' will use introduce 'gd4' 
'gd4' is the every single steps of optimization
a precious part in 'gd4' is the 'reverse', which is the core of Gravity Reverse method
it can effectively make our program spring out of local optima and proceed searching other areas
and....
yeah.... 'gd4' introduces 'fgs' which is the loss function updater.
