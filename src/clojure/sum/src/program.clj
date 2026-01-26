(ns program
	(:gen-class))

(defn -main [& args]
	(println (reduce + (range 101))))
