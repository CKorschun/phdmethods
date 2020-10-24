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
quietly regress eliteschoolcandidate calledback

estimates store Elite_School_Candidate

estimates table Elite_School_Candidate, b(%10.3f) star stats(N r2 r2_a) 
    

putdocx table tbl1 = etable
putdocx paragraph
putdocx text ("The Elite School Candidates appear to make subjects 15 percentage points more likely to be called back.")

putdocx save assignment1.2-research-methods.docx, replace


eststo clear
