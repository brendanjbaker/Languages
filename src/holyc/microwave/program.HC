I64 IsNumeric(U8 *text)
{
  I64 i = 0;

  while (text[i])
  {
    if (text[i] < '0' || text[i] > '9')
      return FALSE;
    i++;
  }

  return TRUE;
}

I64 Main(I64 argc, U8 **argv)
{
  if (argc != 2)
    return 1;

  U8 *input = argv[1];
  I64 inputLength = StrLen(input);

  if (inputLength == 0 || inputLength > 4)
    return 2;

  if (!IsNumeric(input))
    return 2;

  U8 buffer[5];
  buffer[4] = 0;

  I64 pad = 4 - inputLength;
  I64 i;

  for (i = 0; i < pad; i++)
    buffer[i] = '0';

  for (i = 0; i < inputLength; i++)
    buffer[pad + i] = input[i];

  I64 minutes =
    (buffer[0] - '0') * 10 +
    (buffer[1] - '0');

  I64 seconds =
    (buffer[2] - '0') * 10 +
    (buffer[3] - '0');

  if (seconds >= 60)
  {
    if (minutes < 99)
    {
      minutes++;
      seconds %= 60;
    }
  }

  U8 *minutesText = StrPrint(,"%02d",minutes);
  U8 *secondsText = StrPrint(,"%02d",seconds);

  "%s:%s\n", minutesText, secondsText;

  return 0;
}

Main(argc, argv);
