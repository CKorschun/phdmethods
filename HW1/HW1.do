ssc install estout
ssc install reg2docx
insheet using assignment1-research-methods.csv, comma names clear
label variable calledback "Called Back"
label variable eliteschoolcandidate "Elite School Candidate"
reg eliteschoolcandidate calledback
eststo regression_one

esttab regression_one, label title("Table 1: Effect of Elite School Candidates on Call Backs for Interviews") mtitle("Elite School Candidates")
esttab regression_one, addnotes ("The Elite School Candidates appear to make subjects 15 percentage points more likely to be called back.")
esttab using means.rtf, modelwidth(10 20) cell((mean(label(Mean)) sd(par label(Elite School Candidate)))) label nomtitle nonumber replace

global tableoptions "bf(%15.2gc) sfmt(%15.2gc) prehead(\begin{tabular}{l*{14}{c}}) postfoot(\end{tabular}) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one using assignment1-research-methods.tex, $tableoptions keep(calledback)
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one using assignment1-research-methods.rtf, $tableoptions keep(calledback) 
