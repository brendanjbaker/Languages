val sum = List.foldl (op +) 0 (List.tabulate (101, fn i => i));
val sumText = Int.toString sum;
val _ = print (sumText ^ "\n");
