gitignore-gen
=============

Gitignore generator written in Haskell. Prints the resulting gitignores to standard output. Uses [Github's gitignore repo](https://github.com/github/gitignore). No special handling of weird characters, check results.

Example usage:

```
runhaskell gitignore-gen.hs [Language1 Language2] > .gitignore
runhaskell gitignore-gen.hs Haskell > .gitignore
```

Where Language1, Language2 correspond to the names of the gitignore files in [Github's repo](https://github.com/github/gitignore).
