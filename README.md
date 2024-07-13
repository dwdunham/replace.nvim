# replace.nvim
Provides an enhanced substitution function `:R`

## Provides `:%R/PatternToChange/ReplacementForChange/a` that:
* Expands ranges `{a..c} -> a b c` `{c..a} -> c b a`
* Supports increments `{1..5..2} -> 1 3 5`, `{e..a..2} -> e c a`
* Expands lists `{a,e,45}d -> ad ed 45d`
* Supports escaping `a{\\,,;}b -> a,b a;b`
* Supports Replacing multiple casing strategies:
  * string: `test-case`, pattern: `TestCase`, option: 'ismxpndck'
* Casing strategies:
  * p - PascalCase
  * n - snake-case
  * d - dot.case
  * c - camelCase
  * k - kebab-case
  * u - UPPERCASE
  * l - lowercase


* TODO:
  * Add \U, \u, \L and \l -- Maybe?
  * \&
  * \r, \n, \b, \t \\ - done,
