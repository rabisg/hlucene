{-# LANGUAGE TypeFamilies #-}
module HLucene.Analyzers.Simple.SimpleTokenizer where

import Data.Text

import HLucene.Core.Analysis.Tokenizer

data SimpleTokenizer = SimpleTokenizer

instance Tokenizer SimpleTokenizer where
  data Token SimpleTokenizer = SimpleToken { text :: Text
                                           , originalText :: Text
                                           , start :: Integer
                                           , end :: Integer
                                           }
  tokenize = undefined

simpleFieldTokenizer :: FieldTokenizer SimpleTokenizer
simpleFieldTokenizer = MkFieldTokenizer SimpleTokenizer
