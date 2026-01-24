**FREE

dcl-s i int(10);
dcl-s sum int(10);

sum = 0;

for i = 0 to 100;
  sum += i;
endfor;

dsply %char(sum);

*inlr = *on;
return;
