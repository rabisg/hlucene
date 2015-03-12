{-# LANGUAGE Rank2Types #-}
module HLucene.Core.Document.Document
       ( Document(..)
       , TextField
       ) where

import HLucene.Core.Document.Field
import HLucene.Core.Document.Fields.TextField

data Document = Document Fields -- Convert this to a map?
