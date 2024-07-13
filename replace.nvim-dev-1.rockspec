package = "replace.nvim"
version = "dev-1"
source = {
   url = "git:github.com/dwdunham/replace.nvim"
}
description = {
   detailed = [[
Provides a :R command, an extended substitution command
* Expands ranges `{a..c} -> a b c` `{c..a} -> c b a`
* Ranges with increments `{1..5..2} -> 1 3 5`, `{e..a..2} -> e c a`
* Expands lists `{a,e,45}d -> ad ed 45d`
* Supports escaping `a{\\,,;}b -> a,b a;b`
* Supports Replacing multiple casing strategies:
  * string: `test-case`, pattern: `TestCase`, option: 'ismxpndckul'
* Casing strategies:
  * p - PascalCase
  * n - snake-case
  * d - dot.case
  * c - camelCase
  * k - kebab-case
  * u - UPPERCASE
  * l - lowercase]],
  homepage = "https://github.com/dwdunham/replace.nvim",
  license = "Creative Commons CC0 1.0 Universal"
}
dependencies = {
   "lua ~> 5.1"
}
build = {
   type = "builtin",
   modules = {
      ["replace_nvim.init"] = "lua/replace_nvim/init.lua"
   }
}
