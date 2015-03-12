module HLucene.Analyzers.Simple.SimpleAnalyzer where

import HLucene.Analyzers.Simple.SimpleTokenizer
import HLucene.Analyzers.Simple.SimpleTokenStreamFilter
import HLucene.Core.Analysis.Analyzer
import HLucene.Core.Document.Fields.TextField

type SimpleAnalyzer = FieldAnalyzer TextField SimpleTokenizer

simpleAnalyser :: SimpleAnalyzer
simpleAnalyser = FieldAnalyzer cfs simpleFieldTokenizer tsfs
  where
    cfs = []
    tsfs = [stopWordsFilter, stemmerFilter]
