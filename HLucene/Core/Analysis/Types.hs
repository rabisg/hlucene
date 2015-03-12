module HLucene.Core.Analysis.Types
       ( CharStream
       , Stream(..)
       ) where

import Data.Stream

type CharStream = Stream (Char, Integer)
