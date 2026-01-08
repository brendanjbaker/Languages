const { JSDOM } = require("jsdom");
const fs = require("fs");

const dom = new JSDOM(
  `<!DOCTYPE html><div id="app"></div>`,
  { runScripts: "dangerously" }
);

const { window } = dom;
global.window = window;
global.document = window.document;
global.navigator = window.navigator;

// IMPORTANT: evaluate Elm JS *inside the window*
const elmCode = fs.readFileSync("./program.js", "utf8");
window.eval(elmCode);

// Now Elm is correctly attached
window.Elm.Program.init({
  node: document.getElementById("app")
});

// Extract rendered text
console.log(document.body.textContent.trim());
