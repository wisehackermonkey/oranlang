# Grammer for oranlang
# created by oran collins 20211122
@builtin "number.ne" 
@builtin "whitespace.ne" 


main -> operation  _ right_assignment _ var
main -> var _ left_assignment _ operation 
main -> operation


operation -> function| point | number | quoated_string

point -> "(" _ number (_ "," _ number):+ _ ")"



function -> _ function_name _ "(" _ var  (_ "," _ var):* _ ")" _

function_name -> [a-zA-Z_]:+
var -> [a-zA-Z0-9_]:+ 
right_assignment -> "=>"
left_assignment -> "<="
number -> int 


 
quoated_string -> "`" string "`"
string -> [^`]:+

