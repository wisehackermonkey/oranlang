
@builtin "number.ne" 
@builtin "whitespace.ne" 
 

main -> assignment 

#----------assignment ----------
assignment -> operation _ "=>" _ var  {% d=>{ 
	return {"type":"assignment","name": d[4], "value":  d[0]  } 

}%}
assignment -> var _ "<=" _ operation  {% d=>{  
	
	return {"type":"assignment","name": d[0], "value":  d[4]  } }%}
 


# --------exterinal----------
operation ->   point {% d=>  ( {"type":"point","name": null,  "value":d[0] } ) %}
operation ->  number {% id %}
operation ->  quoated_string {% id %}
 

#--------point-------
point -> "(" point ")" {% d=>   d[1] %}
point ->  point  "," point    {% (d)=>   [ d[0],d[2]] %}
point ->  "(" term ")"   {% d=>   d[1] %}
point -> _ term _ {% d=> d[1] %}
term -> (number|var) {% d=>   d[0][0] %}

#-------quoats string-------- currently unused
quoated_string -> "`" string "`"
string -> [^`]:*


#-----terminals------  
var -> [a-zA-Z0-9_]:+ {% d=> ( {"type":"var","name": d[0].join(""),  "value":d[0].join("") } ) %} 
number -> int {% d=> ( {"type":"number","name": null,  "value":d[0] } ) %} 