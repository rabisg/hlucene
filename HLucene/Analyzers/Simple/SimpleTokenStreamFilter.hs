{-# LANGUAGE MultiParamTypeClasses #-}
module HLucene.Analyzers.Simple.SimpleTokenStreamFilter where

import HLucene.Analyzers.Simple.SimpleTokenizer
import HLucene.Core.Analysis.TokenFilter

data StemmerFilter = StemmerFilter

instance IsTokenStreamFilter StemmerFilter SimpleTokenizer where
  filterStream = undefined

stemmerFilter :: TokenStreamFilter SimpleTokenizer
stemmerFilter = MkTokenStreamFilter StemmerFilter


data StopWordsFilter = StopWordsFilter

instance IsTokenStreamFilter StopWordsFilter SimpleTokenizer where
  filterStream = undefined

stopWordsFilter :: TokenStreamFilter SimpleTokenizer
stopWordsFilter = MkTokenStreamFilter StopWordsFilter
