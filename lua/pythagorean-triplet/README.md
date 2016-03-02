# Pythagorean Triplet

There exists exactly one Pythagorean triplet for which a + b + c = 1000. Find the product a * b * c.

A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for
which,

```
a**2 + b**2 = c**2
```

For example, 

```
3**2 + 4**2 = 9 + 16 = 25 = 5**2.
```

### Getting started
First install lua and [luarocks][2] using [homebrew][1]

    $ brew install lua

Then install [busted][3] testing framework for lua

    $ luarocks install busted

Then run your test

    $ busted bob_test.lua

Other resources

  1. [Lua Style Guide][4]
  2. [Learn Lua in 15 minutes][5]

[1]: http://brew.sh/
[2]: http://luarocks.org/
[3]: http://olivinelabs.com/busted/
[4]: https://github.com/Olivine-Labs/lua-style-guide
[5]: http://tylerneylon.com/a/learn-lua/

## Source

Problem 9 at Project Euler [view source](http://projecteuler.net/problem=9)
