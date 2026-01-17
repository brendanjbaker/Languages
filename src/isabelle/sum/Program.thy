theory Program
	imports Main
begin

definition sum_upto :: "nat ⇒ nat" where
	"sum_upto n = sum {0..n}"

lemma sum_upto_formula:
	"sum_upto n = n * (n + 1) div 2"
	unfolding sum_upto_def
	by (simp add: sum.atLeastAtMost_nat)

theorem sum_0_100:
	"sum_upto 100 = 5050"
	by (simp add: sum_upto_formula)

value "sum_upto 100"

end
