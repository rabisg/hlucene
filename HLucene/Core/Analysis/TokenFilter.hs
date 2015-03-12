{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FunctionalDependencies    #-}
{-# LANGUAGE MultiParamTypeClasses     #-}
module HLucene.Core.Analysis.TokenFilter
       ( TokenStreamFilter(..)
       , IsTokenStreamFilter(..)
       ) where

import HLucene.Core.Analysis.Tokenizer
import HLucene.Core.Analysis.Types

class (Tokenizer tokenizer) => IsTokenStreamFilter tsf tokenizer | tsf -> tokenizer  where
  filterStream :: tsf -> Stream (Token tokenizer) -> Stream (Token tokenizer)

data TokenStreamFilter tokenizer = forall tsf. (IsTokenStreamFilter tsf tokenizer) =>
                                   MkTokenStreamFilter tsf
