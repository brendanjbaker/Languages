class
	PROGRAM

create
	make

feature
	make
		local
			sum: INTEGER
			i: INTEGER
		do
			from
				i := 0
				sum := 0
			until
				i > 100
			loop
				sum := sum + i
				i := i + 1
			end

			print(sum)
			print("%N")
		end
end
