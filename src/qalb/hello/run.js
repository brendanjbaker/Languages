import fs from 'fs';
import vm from 'vm';

const sandbox = {
	console: global.console
};

const programSourcePath = '/app/program.qlb';
const programSource = fs.readFileSync(programSourcePath, 'utf8');

const qalbSourcePaths = [
	'/opt/qalb/2db6065/public/qlb/qlb.js',
	'/opt/qalb/2db6065/public/qlb/primitives.js',
	'/opt/qalb/2db6065/public/qlb/parser.js'
];

vm.createContext(sandbox);

qalbSourcePaths.forEach(qalbSourcePath => {
	vm.runInContext(fs.readFileSync(qalbSourcePath, 'utf8'), sandbox);
});

sandbox.Qlb.execute(programSource);
