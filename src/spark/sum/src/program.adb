with Ada.Text_IO; use Ada.Text_IO;

procedure Program with SPARK_Mode
is
   Sum : Integer := 0;

   --------
   --  By default, calling this will raise a compiler warning re: provability:
   --
   --     Put (Item => Sum, Width => 0);
   --
   --  However, using this prints with a leading space because it leaves room
   --  for the negative sign:
   --
   --     Put (Integer'Image (Sum));
   --
   --  Therefore, we'll introduce this helper function to print an integer
   --  without whitespace.
   --
   function PrintInteger (N : Integer) return String is
      Imaged : constant String := Integer'Image (N);
   begin
      if N >= 0 then
         return Imaged (Imaged'First + 1 .. Imaged'Last);
      else
         return Imaged;
      end if;
   end PrintInteger;

begin
   for I in 0 .. 100 loop
      pragma Loop_Invariant
         (Sum = (I * (I - 1)) / 2);
      Sum := Sum + I;
   end loop;

   Put (PrintInteger (Sum));
   New_Line;
end Program;
