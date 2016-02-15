# Pig Latin

Implement a program that translates from English to Pig Latin

Pig Latin is a made-up children's language that's intended to be
confusing. It obeys a few simple rules (below), but when it's spoken
quickly it's really difficult for non-children (and non-native speakers)
to understand.

- **Rule 1**: If a word begins with a vowel sound, add an "ay" sound to
  the end of the word.
- **Rule 2**: If a word begins with a consonant sound, move it to the
  end of the word, and then add an "ay" sound to the end of the word.

There are a few more rules for edge cases, and there are regional
variants too.

See <http://en.wikipedia.org/wiki/Pig_latin> for more details.

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

The Pig Latin exercise at Test First Teaching by Ultrasaurus [view source](https://github.com/ultrasaurus/test-first-teaching/blob/master/learn_ruby/pig_latin/)
