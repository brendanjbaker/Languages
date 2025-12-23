import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.range;

int main(string[] args)
{
    if (args.length != 2)
        return 1;

    string input = args[1];

    if (input.length == 0 || input.length > 4)
        return 2;

    if (!isNumeric(input))
        return 2;

    string inputFixedSize = rightJustify(input, 4, '0');

    string minutesText = inputFixedSize[0..2];
    string secondsText = inputFixedSize[2..4];

    int minutes = to!int(minutesText);
    int seconds = to!int(secondsText);

    if (seconds >= 60)
    {
        if (minutes < 99)
        {
            minutes++;
            seconds %= 60;
        }
    }

    writefln("%02d:%02d", minutes, seconds);

    return 0;
}

bool isNumeric(string text)
{
    return text.all!(c => c >= '0' && c <= '9');
}
