{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleInstances         #-}
{-# LANGUAGE MultiParamTypeClasses     #-}
{-# LANGUAGE RankNTypes                #-}
{-# LANGUAGE TypeFamilies              #-}
module HLucene.Core.Analysis.Analyzer
       ( Analyzer(..)
       , FieldAnalyzer(..)
       ) where

import qualified Data.Stream as S
import           Data.Text   (Text)

import HLucene.Core.Analysis.CharFilter
import HLucene.Core.Analysis.TokenFilter
import HLucene.Core.Analysis.Tokenizer
import HLucene.Core.Document.Field

data FieldAnalyzer field tokenizer = FieldAnalyzer { faCharFilters        :: [CharFilter]
                                                   , faFieldTokenizer     :: FieldTokenizer tokenizer
                                                   , faTokenStreamFilters :: [TokenStreamFilter tokenizer]
                                                   }

class (Field f, Tokenizer tokenizer) => Analyzer a tokenizer f where
  analyze :: a -> f -> S.Stream (Token tokenizer)

instance (Field f, FieldData f ~ Text, Tokenizer tok) => Analyzer (FieldAnalyzer f tok) tok f where
  analyze analyzer field = applySeq filters tokenStream
    where
      applySeq = foldl (.) id
      filters = map (\(MkTokenStreamFilter f) -> filterStream f) (faTokenStreamFilters analyzer)
      tokenStream = case faFieldTokenizer analyzer of
            (MkFieldTokenizer ft) -> tokenize ft cs
      cs = applySeq cFilters cs'
      cFilters = map (\(MkCharFilter cf) -> applyCharFilter cf) (faCharFilters analyzer)
      cs' = toCharStream $ fieldData field
