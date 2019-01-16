# hs-ast

Super simple program to pretty-print the AST of a Haskell 98 source file.

```haskell
$ cat Foo.hs 
module Foo where

main :: IO ()
main = print "Hello"
```

```none
$ hs-ast Foo.hs
HsModule 
    ( SrcLoc 
        { srcFilename = "<unknown>" 
        , srcLine = 1
        , srcColumn = 1
        } 
    ) ( Module "Foo" ) Nothing [] 
    [ HsTypeSig 
        ( SrcLoc 
            { srcFilename = "<unknown>" 
            , srcLine = 3
            , srcColumn = 1
            } 
        ) [ HsIdent "main" ] 
        ( HsQualType [] 
            ( HsTyApp 
                ( HsTyCon 
                    ( UnQual ( HsIdent "IO" ) )
                ) 
                ( HsTyCon ( Special HsUnitCon ) )
            )
        )
    , HsPatBind 
        ( SrcLoc 
            { srcFilename = "<unknown>" 
            , srcLine = 4
            , srcColumn = 1
            } 
        ) 
        ( HsPVar ( HsIdent "main" ) ) 
        ( HsUnGuardedRhs 
            ( HsApp 
                ( HsVar 
                    ( UnQual ( HsIdent "print" ) )
                ) 
                ( HsLit ( HsString "Hello" ) )
            )
        ) []
    ] 
```