import std.stdio: writefln;
import std.random: MinstdRand0, randomShuffle, unpredictableSeed;
import std.range: array, iota, take;
import std.algorithm.sorting: sort;

auto draw(uint n, uint m)
{
    // Park and Miller's "minimal standard" seed with a constant
    auto rndGenerator = MinstdRand0(1);
    
    // Seed with an unpredictable value
    rndGenerator.seed(unpredictableSeed);
    
    auto res = iota(1, m+1)
                .array
                .randomShuffle(rndGenerator)
                .take(n)
                .sort!"a < b";
    
    version (X86_64)
    
    return res;
}

void main()
{    
    // In remembrance of Seloto 6/36 - The first Malagasy lotto back in 1989
    const N = 6;
    const M = 36;
    
    // Print 10
    foreach(i; iota(10))
    {
        auto arr = draw(N, M);
        
        writefln("%(%2s %|%)", arr);
    }
}
