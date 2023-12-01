import day1;
import std.algorithm.searching;

void main(string[] args)
{
    if (args.length == 1) day1Main;

    else
    {
        if (args.canFind("1")) day1Main;
    }
}