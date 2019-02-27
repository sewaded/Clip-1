# Clip-1
This is a crude code I used in one of my research project, in which I am to find a energy minima of a H2O model. It mainly contains 'initial' 'gds' 'gd4' 'fgs'.
Don't try to figure out why I named them so.....
'initial' is the main root . Do plz include gds gd4 fgs and the H4 H5 ... H70 data before running the code.
Select which matrix(H4 H5 H8 ... H70) u'd like to use as a model for H2O by commenting off certain lines of code.
Then simply run 'initial' and watch. It will not end, because we should never presume we have truly found the global optimum.Ctrl-C when u think u've already reached there or u're already tired.
(Oh this code is really really exclusive to myself....but effective).
The 'initial' function would generate a random initial point for further searching.
It will use 'gds' for Gradient-Descent iteration.
And 'gds' will use introduce 'gd4' .
'gd4' is the every single steps of optimization.
A precious part in 'gd4' is the 'reverse', which is the core of Gravity Reverse method.
It can effectively make our program spring out of local optima and proceed searching other areas.
And....
Yeah.... 'gd4' introduces 'fgs' which is the loss function updater.
Oh btw, don't try H70 or H37. They are too too too time-consuming.
