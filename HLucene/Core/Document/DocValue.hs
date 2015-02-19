module HLucene.Core.Document.DocValue
       ( DocValueType(..) ) where

-- |https://lucene.apache.org/core/4_0_0/core/org/apache/lucene/index/DocValues.Type.html
data DocValueType = DocValueTypeFixedBytes Integer
                  | DocValueTypeVarBytes
                  | DocValueFixedInt Integer
                  | DocValueTypeVarInt
                  deriving Show
