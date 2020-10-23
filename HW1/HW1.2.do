ssc install estout
ssc install reg2docx
insheet using assignment1-research-methods.csv, comma names clear
putdocx clear 
putdocx begin

// Create a paragraph
putdocx paragraph
putdocx text ("putdocx "), bold
putdocx text ("can add formatted text to a paragraph.  You can ")
putdocx text ("italicize, "), italic
putdocx text ("strikeout, "), strikeout
putdocx text ("underline"), underline
putdocx text (", sub/super script")
putdocx text ("2 "), script(sub)
putdocx text (", and ")
putdocx text ("shade"), shading("blue")
qui sum calledback
local sum : display %4.2f `r(sum)'
putdocx text (".  Also, you can easily add Stata results to your paragraph (calledback total = `sum')")


// Embed Stata output
putdocx paragraph

putdocx text ("Embed the output from a regression command into your docx file.")
label variable calledback "called back"
label variable eliteschoolcandidate "Elite School Candidate"
regress eliteschoolcandidate calledback
putdocx table mytable = etable


putdocx save "assignment1-research-methods.docx", replace
