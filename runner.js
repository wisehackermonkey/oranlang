const fs = require("fs")

const nearley = require("nearley")

// the javascript convereted language grammer parser for oranlang
const grammer = require("./assingment")

const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammer))

filename = process.argv[2] 
// input = process.argv[3]

code = fs.readFileSync(filename).toString()
parser.feed(code)


if(parser.results.length > 1){
    console.warn("Warn: Your grammer has ambugites")

    const ast = parser.results[0]

    const output_filename =  filename.replace(".olang",".ast")
    fs.writeFileSync(output_filename,JSON.stringify(ast,null," "))
    console.log(`Wrote ast to ${output_filename}`)
}else if(parser.results.length === 1){
    const ast = parser.results[0]

    const output_filename =  filename.replace(".olang",".ast")
    fs.writeFileSync(output_filename,JSON.stringify(ast,null," "))
    console.log(`Wrote ast to ${output_filename}`)
}else{
    console.log(`File not found, please enter ".olang" file `)

}
