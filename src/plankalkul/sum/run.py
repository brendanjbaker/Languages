from plankalkul import run

with open("program.plan", "r", encoding="utf-8") as f:
	plan = f.read()

state = run(plan, 0, 100)
output = state['R0']

print(output)
