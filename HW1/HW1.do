ssc install estout
ssc install reg2docx
insheet using assignment1-research-methods.csv, comma names clear
label variable calledback "called back"
label variable eliteschoolcandidate "Elite School Candidate"
reg eliteschoolcandidate calledback
eststo regression_one
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) prehead(\begin{tabular}{l*{14}{c}}) postfoot(\end{tabular}) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one using assignment1-research-methods.tex, $tableoptions keep(calledback)
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one using assignment1-research-methods.docx, $tableoptions keep(calledback) 
