ssc install estout
ssc install reg2docx
insheet using assignment1-research-methods.csv, comma names clear
label variable calledback "called back"
label variable eliteschoolcandidate "Elite School Candidate"
reg eliteschoolcandidate calledback
eststo regression_one

putdocx begin
putdocx table tbl1 = esttab
putdocx save assignment-research-methods
