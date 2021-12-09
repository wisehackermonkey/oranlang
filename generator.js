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
        case "assignment":
            var expression = generateStatement(token.value)
            return `var ${token.name.name} = ${expression}`

            break;
        case "point":
            let arrayList = token.value.map((_token) => {
                return generateStatement(_token)
            }).join(", ")

            return `[${arrayList}]`; break;

        case "print":
            let printable_token = generateStatement(token.value)
            return `console.log(${printable_token})`;
            break;
        case "number": return token.value; break;
        case "var": return token.value; break;

        default:
            throw new Error(`Error: token was unparseable "${JSON.stringify(token)}"`)
            break;
    }
}


let code = generate(ast)
console.log("###\n", code, "\n###")
const output_filename = filename.replace(".ast", ".compiled.olang.js")
fs.writeFileSync(output_filename, code)
console.log(`Wrote ast to ${output_filename}`)
