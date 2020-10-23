ssc install estout
ssc install reg2docx
insheet using assignment1-research-methods.csv, comma names clear
putdocx clear 
putdocx begin

// Create a paragraph
putdocx paragraph
putdocx text ("Table 1:"), bold
putdocx text (" Effect of Elite School Candidates on Call Backs for Interviews")
qui sum calledback
local sum : display %4.2f `r(sum)'


// Embed Stata output
putdocx paragraph

label var calledback "Called Back"
label var eliteschoolcandidate "Elite School Candidate"
regress eliteschoolcandidate calledback
putdocx table mytable = etable

global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab using assignment1-research-methods.docx, $tableoptions keep(calledback) 

putdocx paragraph
putdocx text ("The Elite School Candidates appear to make subjects 15 percentage points more likely to be called back.")


putdocx save "assignment1.2-research-methods.docx", replace
