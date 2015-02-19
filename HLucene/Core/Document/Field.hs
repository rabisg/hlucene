{-# LANGUAGE Rank2Types   #-}
{-# LANGUAGE TypeFamilies #-}
module HLucene.Core.Document.Field
       ( FieldIndexOptions(..)
       , FieldOptions(..)
       , FieldType(..)
       , Field(..)
       , Fields
       ) where

import HLucene.Core.Document.DocValue (DocValueType)

-- | https://lucene.apache.org/core/4_0_0/core/org/apache/lucene/index/FieldInfo.IndexOptions.html
data FieldIndexOptions = DocsOnly
                       | DocsAndFreq
                       | DocsFreqAndPos
                       | DocsFreqPosAndOffset
                       deriving Show

-- | https://lucene.apache.org/core/4_0_0/core/org/apache/lucene/document/FieldType.html
data FieldOptions = FieldOptions
                    { isIndexed :: Bool -- Whether this field should be (inverted) indexed
                    , isStored  :: Bool -- Whether this field should be stored
                    }

data FieldType = FieldType
                 { isTokenized  :: Bool -- Whether this field should be tokenized
                 , docValueType :: DocValueType
                 , indexOptions :: FieldIndexOptions
                 } deriving Show

-- | https://lucene.apache.org/core/4_0_0/core/org/apache/lucene/document/Field.html
class (Show field) => Field field where
  type FieldData field
  fieldData :: field -> FieldData field
  fieldName :: field -> String
  fieldType :: field -> FieldType
  fieldOptions :: field -> FieldOptions

type Fields = forall f. (Field f) => [f]
