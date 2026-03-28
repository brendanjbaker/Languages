const fs = require("fs");
const { NospaceIR } = require('/opt/nospace/0.0.1/build/parser/src/index.js');
const { Program } = require('/opt/nospace/0.0.1/build/nose/src/index.js');

const source = fs.readFileSync("./program.ns", "utf8");
const ir = NospaceIR.fromNospace(source);
const program = new Program(ir, source);

program.execute();

const output = program.output;

process.stdout.write(output);
