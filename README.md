gitignore-gen
=============

Gitignore generator written in Haskell. Prints the resulting gitignores to standard output. Uses [Github's gitignore repo](https://github.com/github/gitignore). No special handling of weird characters, check results.

Example usage:

```
runhaskell gitignore-gen.hs Haskell > .gitignore
```
