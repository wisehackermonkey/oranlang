@builtin "whitespace.ne"
@builtin "number.ne" 
@{%
const unest = (d) =>{
 
	return d.flat(10)
}

const unnestMatrix = (arr)=>{
  if(typeof arr[arr.length-1] === undefined){
    return   
  }
  if(typeof arr[arr.length-1] === "number"){
     return [arr]
  } 

return [arr[0]] .concat( unnestMatrix(arr[arr.length-1]))  

}
%}
main -> function (" "):+ code_block return_statement  {% d=>  [d[0],d[2],d[3] ] %}
# allows for newlines and creates a block of code anything with between function <-> return
# --codeblock------
code_block
    ->  _ "\n" code_block
	      {% (d) => d[2] %}
     |  _ runnable_code _
	      {% d => [d[1]] %}
     |  _ runnable_code _ "\n" code_block
	      {% d => [d[1], ...d[4]] %}
    
runnable_code -> asignment {% d=>  d[0] %}
 
#-----function name-----------
function -> _ function_name _ "(" _ var  (repeat_var):* _ ")" _  
          {% d=>  ["function", d[1],d[5], ...unest(d[6])] %}

#------------matrix--------
# allows for multi line matrix 
matrix
    -> _ "\n"  matrix  {% d=>  d[2] %}
     | _ matrix_row  _  {% d=>  d[1] %}
     | _  matrix_row _ "\n" matrix  {% d=>  [d[1],d[4]] %}

matrix_row -> "|" _ number ( repeated_number):+ _  "|" {% d=>  [d[2], ...unest(d[3]) ]%}


# -------------return statemetnt------------
return_statement ->  "return" (" "|"  "|"   "|"    "):?  {% d=>  ["return_statement", null] %}
return_statement ->  "return"  (" "|"  "|"   "|"    ")  ( return_value _):? {% d=>  ["return_statement", d[2]] %}

# variable
repeat_var -> _ "," _ var     {% d=>  [d[3] ] %}


point -> "(" _  term (repeated_number):+ _ ")" {% d=>   ["point",d[2],...unest(d[3])] %}
term -> (number|var) {% d=>   d[0][0] %}
repeated_number -> _ "," _ term {% d=>   [ d[3]] %}

   
#----------asignment ----------
asignment -> operation _ right_assignment _ var {% d=>  ["asignment",d[4], d[0] ]%}
asignment -> var _ left_assignment _ operation {% d=>  ["asignment",d[0],  d[4] ]%}

right_assignment -> "=>" {% d=>  d[0] %}
left_assignment -> "<=" {% d=>  d[0] %}

operation ->  point {% d=>  d[0] %}
operation ->  number {% d=>  d[0] %}
operation ->  matrix {% d=> { return unnestMatrix(d).splice(1); }%}
operation ->  quoated_string {% d=>  d[0] %}
operation ->  generator_string {% d=>  d[0] %}

return_value ->  matrix {% d=> { return unnestMatrix(d).splice(1); }%}
return_value -> (point | var  | number)  {% d=>   d[0][0][0] %}


right_assignment -> "=>" {% d=>  d[0] %}
left_assignment -> "<=" {% d=>  d[0] %}

#-------quoats string--------
quoated_string -> "`" string "`" {% d=>   ["quoated_string",d[1]]%}

#-----generator---string-----
generator_string -> "g" "`" string "`" {% d=>  ["generator_string", d[2]]%}

# terminals 
number -> int {% d=>  d[0] %}
function_name -> [a-zA-Z_]:+ {% d=>  d[0].join("")%}
#-------variable--name------
var -> [a-zA-Z_] [a-zA-Z0-9_]:* {% d=>  d[0]+d[1].join("")  %}
string -> [^`]:* {% d=>  d[0].join("")%}
