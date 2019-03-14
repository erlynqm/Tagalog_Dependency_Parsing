# Tagalog_Dependency_Parsing


#### CoNLL Data Format

    Column 1 Token Index
    Column 2 Token
    Column 3 lemma
    Column 4 Coarse-grain tag
    Column 5 Fine-grain tag
    Columns 6-9: prefix|infix|suffix|reduplication (if any. If none, use  underscore  '_'
    Column 10: head's index (based on Col 1. If token is head of sentence, Column 10 == 0)
    Column 11: dep relations (in this case, we did not label so we marked it with underscore '_'
    
#### format reference: 

      https://ilk.uvt.nl/~emarsi/download/pubs/14964.pdf
      
      
#### MST Format 

Example:

      itinakwil	siya	ng	lahat	maliban	lamang	sa	kanyang	maybahay .
      PFOF	PRSG	CCB	PRI	CCT	RI	CCT	POSG	CP	PMP
      0	1	4	1	1	5	9	9	5	9

    Line 1 : input sentence
    Line 2 : POS Tag
    Line 3 : index of the head. In case token is the head of the sentence, 0


      
     
