actor Main
	new create(env: Env) =>
		var sum: I32 = 0
		var i: I32 = 0

		while i <= 100 do
			sum = sum + i
			i = i + 1
		end

		env.out.print(sum.string())
