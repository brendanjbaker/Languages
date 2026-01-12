with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Program with SPARK_Mode
is
   Sum : Integer := 0;
begin
   for I in 0 .. 100 loop
      pragma Loop_Invariant
         (Sum = (I * (I - 1)) / 2);
      Sum := Sum + I;
   end loop;

   Put(Item => Sum, Width => 0);
   New_Line;
end Program;
