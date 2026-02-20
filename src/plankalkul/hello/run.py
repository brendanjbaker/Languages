from plankalkul import run

with open("program.plan", "r", encoding="utf-8") as f:
	plan = f.read()

state = run(plan)
character_codes = state['R0']
output = ''.join(chr(code) for code in character_codes)

print(output)
