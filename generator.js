const fs = require("fs")


// the javascript convereted language grammer parser for oranlang


filename = process.argv[2]

const ast = JSON.parse(fs.readFileSync(filename).toString())


// code = 
const output_filename = filename.replace(".ast", ".compiled.olang.js")
fs.writeFileSync(output_filename, JSON.stringify(ast, null, " "))
console.log(`Wrote ast to ${output_filename}`)
