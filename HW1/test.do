ssc install estout
ssc install reg2docx
insheet using assignment1-research-methods.csv, comma names clear
putdocx clear 

putdocx begin
putdocx paragraph, halign(center)
putdocx text ("This is paragraph text"), bold

putdocx table tbl1 = (3,4)
putdocx table tbl1(1,2) = ("Cell 2"), halign(right)

quietly regress eliteschoolcandidate calledback

putdocx save myfile2.docx
