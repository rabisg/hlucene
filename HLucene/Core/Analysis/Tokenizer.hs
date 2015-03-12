{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE TypeFamilies              #-}
module HLucene.Core.Analysis.Tokenizer
       ( Tokenizer(..)
       , FieldTokenizer(..)
       ) where

import HLucene.Core.Analysis.Types

class Tokenizer tokenizer where
  data Token tokenizer
  tokenize :: tokenizer -> CharStream -> Stream (Token tokenizer)

data FieldTokenizer t = Tokenizer t => MkFieldTokenizer t
