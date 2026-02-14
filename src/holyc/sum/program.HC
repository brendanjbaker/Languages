I64 Main()
{
  I64 i, sum = 0;

  for (i = 0; i <= 100; i++)
    sum += i;

  U8 *sumText = StrPrint(,"%d",sum);

  "%s\n", sumText;

  return 0;
}

Main;
