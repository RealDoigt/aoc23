module day1.main;
import std.conv;
import common;

struct Pair
{
    char a = '\0', b = '\0';
    
    auto num()
    {
        if (a == '\0' && b == '\0') 
            return 0;
            
        if (b == '\0') 
            return "$0$0".dasformat(a).to!int;
        
        return "$0$1".dasformat(a, b).to!int;
    }
}

auto sum(Pair[] pairs)
{
    int total;
    
    foreach (p; pairs) total += p.num;
    return total;
}

void day1Main()
{
    auto lines = "res/day1/input".readText.split("\n");
    Pair[] pairs;
    auto spelledOutNums =
    [
        "one"   : 1,
        "two"   : 2,
        "three" : 3,
        "four"  : 4,
        "five"  : 5,
        "six"   : 6,
        "seven" : 7,
        "eight" : 8,
        "nine"  : 9
    ];
    
    foreach(line; lines)
    {
        if (line.length == 0) continue;
        
        auto p = Pair();
        
        foreach(c; line)
            if (c >= '0' && c <= '9')
            {
                if (p.a == '\0') p.a = c;
                else p.b = c;
            }
            
        pairs ~= p;
    }
    
    "The sum of all calibration values is %d".writefln(pairs.sum);
}