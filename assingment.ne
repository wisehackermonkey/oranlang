
@builtin "number.ne" 
@builtin "whitespace.ne" 
@{%
const unest = (d) =>{
	return d.flat(10)
}
%}

main -> asignment {% id %}

#----------asignment ----------
asignment -> operation _ "=>" _ var {% d=>  {type:"asignment", name: null, value: [d[4], d[0] ] }%}
asignment -> var _ "<=" _ operation {% d=>   {type:"asignment",name: null, value:[d[0],  d[4] ] }%}
 


# --------exterinal----------
operation ->   point {% d=>  ["point", d[0]] %}
operation ->  number {% id %}
operation ->  quoated_string {% id %}
 

#--------point-------
point -> "(" point ")" {% d=>   d[1] %}
point ->  point  "," point    {% (d)=>   [ d[0],d[2]] %}
point ->  "(" term ")"   {% d=>   d[1] %}
point -> _ term _ {% d=> d[1] %}
term -> (number|var) {% d=>   d[0][0] %}

#-------quoats string--------
quoated_string -> "`" string "`"
string -> [^`]:*


#-----terminals------
var -> [a-zA-Z0-9_]:+ {% d=>  d[0].join("")%}
number -> int {% id %}