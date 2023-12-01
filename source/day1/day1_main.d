module day1.main;
import std.regex;
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

auto getPairs(string[] lines, bool replaceWords = false)
{
    Pair[] pairs;
    
    foreach(line; lines)
    {
        if (line.length == 0) continue;
        
        if (replaceWords) 
        { 
            line = line.replaceAll("one".regex  , "1");
            line = line.replaceAll("two".regex  , "2");
            line = line.replaceAll("three".regex, "3");
            line = line.replaceAll("four".regex , "4");
            line = line.replaceAll("five".regex , "5");
            line = line.replaceAll("six".regex  , "6");
            line = line.replaceAll("seven".regex, "7");
            line = line.replaceAll("eight".regex, "8");
            line = line.replaceAll("nine".regex , "9");
            //line = line.replaceAll("zero".regex , "0");
        }
        
        auto p = Pair();
        
        foreach(c; line)
            if (c >= '0' && c <= '9')
            {
                if (p.a == '\0') p.a = c;
                else p.b = c;
            }
            
        pairs ~= p;
    }
    
    return pairs;
}

void day1Main()
{
    auto lines = "res/day1/input".readText.split("\n");
    
    "The wrong sum of all calibration values is %d".writefln(getPairs(lines).sum);
    "The correct sum of all calibration values is %d".writefln(getPairs(lines, true).sum);
}