@builtin "whitespace.ne"
@builtin "number.ne" 

main -> _ code_block  {% (d) => d[1] %}

code_block ->  _ "\n" code_block                  {% (d) => d[2] %}
code_block ->  _ runnable_code _                  {% d => [d[1]] %}
code_block ->  _ runnable_code _ "\n" code_block  {% d => [d[1], ...d[4]] %}
    
	 

runnable_code -> assignment
runnable_code -> print
    
	 

#----------assignment ----------
assignment -> operation _ "=>" _ var  {% d=>{ 
	return {"type":"assignment","name": d[4], "value":  d[0]  } 

}%}
assignment -> var _ "<=" _ operation  {% d=>{  
	
	return {"type":"assignment","name": d[0], "value":  d[4]  } }%}
 
#--------print------------
print -> "print" _  operation _   {% d=>  ( {"type":"print","name": null,  "value":d[2] } ) %}
 
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

#-------quoats string--------
quoated_string -> "`" string "`"  {% d=>   d[1] %}
string -> [^`]:* {% d=>  ( {"type":"string","name": null,  "value":d[0].join("") } ) %}




#-------variable--name------
var -> [a-zA-Z_] [a-zA-Z0-9_]:* {% d=>  d[0]+d[1].join("")  %}

#-----terminals------   
number -> int {% d=> ( {"type":"number","name": null,  "value":d[0] } ) %} 