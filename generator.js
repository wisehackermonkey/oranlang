const fs = require("fs")


// the javascript convereted language grammer parser for oranlang


filename = process.argv[2]

const ast = JSON.parse(fs.readFileSync(filename).toString())

console.log(ast)

const generate = (ast) => {
    const lines = []
    for (let token of ast) {

        let line = generateStatement(token)
        lines.push(line)
    }
    return lines.join("\n")
}

const generateStatement = (token) => {
    switch (token.type) {

        case "point": return point(token.value); break;
        case "assignment":
            let value = generateStatement(token.value)
            return assignment(token.name, token.value);

            break;
        default:
            throw new Error(`Error: token was unparseable "${JSON.stringify(token)}"`)
            break;
    }
}
const assignment = (name, value) => `var ${name} = ${value}`

const point = (value) => {
    return [...value]
}

let code = generate(ast)
console.log("###\n", code, "\n###")
const output_filename = filename.replace(".ast", ".compiled.olang.js")
fs.writeFileSync(output_filename, code)
console.log(`Wrote ast to ${output_filename}`)
